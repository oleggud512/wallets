
import 'package:ads_pay_app/src/features/history/domain/entities/account.dart';
import 'package:ads_pay_app/src/features/history/presentation/history_page.dart';
import 'package:ads_pay_app/src/features/settings/presentation/settings_page.dart';
import 'package:ads_pay_app/src/features/auth/infrastructure/repositories/firebase_auth_repository_impl.dart';
import 'package:ads_pay_app/services/database_service.dart';
import 'package:ads_pay_app/services/theme_service.dart';
import 'package:ads_pay_app/src/core/common/hardcoded.dart';
import 'package:ads_pay_app/src/core/presentation/yes_no_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../domain/entities/wallet.dart';
import '../wallet_widget.dart';
import '../add_wallet/add_wallet_page.dart';

@RoutePage()
class WalletsPage extends StatefulWidget {
  const WalletsPage({Key? key}) : super(key: key);

  @override
  State<WalletsPage> createState() => _WalletsPageState();
}

class _WalletsPageState extends State<WalletsPage> with TickerProviderStateMixin {
  late FirebaseAuthRepositoryImpl authServ;
  late DatabaseService dbServ;
  late ThemeService themeServ;
  late Stream<Account> accountStream;
  late Account account;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Wallet? curWallet;
  bool isBottomSheetOpened = false;

  @override
  void initState() {
    super.initState();
    authServ = context.read<FirebaseAuthRepositoryImpl>();
    themeServ = context.read<ThemeService>();
    dbServ = context.read<DatabaseService>();
    accountStream = dbServ.getAccountStream();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Wallets'.hardcoded),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage()
                )
              );
            },
          )
        ]
      ),
      body: StreamBuilder<Account>(
        stream: accountStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            account = snapshot.data!;
            configureCurWallet(account);
            print('something comes from Accounts Stream');
            return buildWallets();
          }
          return const Center(child: CircularProgressIndicator());
        }
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Wallet'.hardcoded,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddWalletPage(),
            ),
          );
        }
      ),
    );
  }

  Widget buildWallets() {
    return Padding(
      padding: const EdgeInsets.only(
        left: ThemeService.defaultPadding,
      ),
      child: SingleChildScrollView(
        child: ResponsiveGridRow(
          children: [
            ...account.wallets.map(
              (w) => ResponsiveGridCol(
                xs: 6, sm: 4, md: 4, lg: 2, xl: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: ThemeService.defaultPadding,
                    right: ThemeService.defaultPadding
                  ),
                  child: WalletWidget(
                    wallet: w,
                    onDelete: () async {
                      bool? delete = await YesNoDialog(
                        message: 'Are you sure to delete this wallet?'.hardcoded
                      ).show(context);
                      if (delete == true) {
                        dbServ.deleteWallet(w.wid);
                      }
                    },
                    onTap: () {
                      setState(() {
                        curWallet = w;
                        // closeBottomSheet();
                      });
                    },
                    onHistoryButton: () {
                      // if (!openBottomSheet()) closeBottomSheet();
                      Navigator.push(context, 
                        MaterialPageRoute(
                          builder: (_) => HistoryPage(walletId: w.wid)
                        )
                      );
                    },
                    isSelected: curWallet!.wid == w.wid,
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  void configureCurWallet(Account account) {
    if (curWallet == null && account.wallets.isNotEmpty) {
      curWallet = account.wallets[0];
    } else if (curWallet != null) {
      try {
        curWallet = account.wallets.firstWhere((w) => w.wid == curWallet!.wid);
      } catch (e) {
        curWallet = account.wallets.isNotEmpty 
          ? account.wallets[0] 
          : null;
      }
    }
  }
}