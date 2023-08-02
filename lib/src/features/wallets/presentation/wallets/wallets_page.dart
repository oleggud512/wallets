
import 'package:ads_pay_app/services/database_service.dart';
import 'package:ads_pay_app/src/core/common/constants/constants.dart';
import 'package:ads_pay_app/src/core/presentation/theme/theme_bloc.dart';
import 'package:ads_pay_app/src/core/common/hardcoded.dart';
import 'package:ads_pay_app/src/core/presentation/yes_no_dialog.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/wallets/wallets_page_bloc.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/wallets/wallets_page_event.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/wallets/wallets_page_states.dart';
import 'package:ads_pay_app/src/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../../get_it.dart';
import '../../application/use_cases/delete_wallet_use_case.dart';
import '../../application/use_cases/watch_wallets_use_case.dart';
import '../../domain/entities/wallet.dart';
import '../wallet/wallet_widget.dart';

@RoutePage()
class WalletsPage extends StatefulWidget {
  const WalletsPage({Key? key}) : super(key: key);

  @override
  State<WalletsPage> createState() => _WalletsPageState();
}

class _WalletsPageState extends State<WalletsPage> with TickerProviderStateMixin {
  late DatabaseService dbServ;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Wallet? curWallet;
  bool isBottomSheetOpened = false;

  @override
  void initState() {
    super.initState();
    dbServ = context.read<DatabaseService>();
  }

  void onDeleteWallet(String walletId) async {
    bool? delete = await YesNoDialog(
      message: 'Are you sure to delete this wallet?'.hardcoded
    ).show(context);

    if (delete == true && mounted) {
      context.read<WalletsPageBloc>().add(WalletsPageDeleteWalletEvent(walletId));
      // dbServ.deleteWallet(walletId);
    }
  }

  Future<void> onOpenSettings() async {
    await context.pushRoute(const SettingsRoute());
  }

  Future<void> onOpenHistory() async {
    if (curWallet != null) {
      context.pushRoute(HistoryRoute(walletId: curWallet!.wid));
    }
  }

  Future<void> onAddWallet() async {
    await context.pushRoute(const AddWalletRoute());
  }

  void setCurWallet(Wallet otherWallet) {
    setState(() {
      curWallet = otherWallet;
    });
  }

  void configureCurWallet(List<Wallet> wallets) {
    if (curWallet == null && wallets.isNotEmpty) {
      curWallet = wallets[0];
    } else if (curWallet != null) {
      try {
        curWallet = wallets.firstWhere((w) => w.wid == curWallet!.wid);
      } catch (e) {
        curWallet = wallets.isNotEmpty 
          ? wallets[0] 
          : null;
      }
    }
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
            onPressed: onOpenSettings,
          )
        ]
      ),
      body: BlocProvider(
        create: (_) => WalletsPageBloc(
          getIt<DeleteWalletUseCase>(),
          getIt<WatchWalletsUseCase>()
        )..add(WalletsPageStartEvent()),
        child: BlocBuilder<WalletsPageBloc, WalletsPageState>(
          builder: (context, state) {
            switch (state) {
              case WalletsPageDefaultState():
                configureCurWallet(state.wallets);
                return state.wallets.isEmpty 
                  ? buildPlaceholder()
                  : buildWallets(state.wallets);
              default: 
                return const Center(child: CircularProgressIndicator());
            }
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Wallet'.hardcoded,
        onPressed: onAddWallet,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildWallets(List<Wallet> wallets) {
    return Padding(
      padding: const EdgeInsets.only(
        left: p8,
      ),
      child: SingleChildScrollView(
        child: ResponsiveGridRow(
          children: wallets.map(
            (w) => ResponsiveGridCol(
              xs: 6, sm: 4, md: 4, lg: 2, xl: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: p8,
                  right: p8
                ),
                child: WalletWidget(
                  wallet: w,
                  isSelected: curWallet!.wid == w.wid,
                  onDelete: () => onDeleteWallet(w.wid),
                  onTap: () => setCurWallet(w),
                  onHistoryButton: onOpenHistory,
                ),
              ),
            )
          ).toList(),
        ),
      ),
    );
  }

  Widget buildPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: p16),
          child: Text('Click this button to add your first wallet!'.hardcoded, 
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.grey.shade600
            )
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.south_east_rounded, 
              size: p64, 
              color: Colors.grey.shade600
            ),
            const SizedBox(width: p72)
          ],
        ),
        const SizedBox(height: p72)
      ],
    );
  }
}