
import 'package:ads_pay_app/src/core/common/constants/sizes.dart';
import 'package:ads_pay_app/src/core/presentation/localization/locale_keys.g.dart';
import 'package:ads_pay_app/src/core/presentation/yes_no_dialog.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/wallets/wallets_page_bloc.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/wallets/wallets_page_event.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/wallets/wallets_page_states.dart';
import 'package:ads_pay_app/src/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
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

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Wallet? curWallet;
  bool isBottomSheetOpened = false;

  @override
  void initState() {
    super.initState();
  }

  void onDeleteWallet(BuildContext context, String walletId) async {
    bool? delete = await YesNoDialog(
      message: context.tr(LocaleKeys.confirmDeleteWallet)
    ).show(context);

    if (delete == true && mounted) {
      context.read<WalletsPageBloc>().add(WalletsPageDeleteWalletEvent(walletId));
    }
  }

  Future<void> onOpenSettings(BuildContext context) async {
    await context.pushRoute(const SettingsRoute());
  }

  Future<void> onOpenHistory(BuildContext context) async {
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
    return BlocProvider(
      create: (_) => WalletsPageBloc(
        getIt<DeleteWalletUseCase>(),
        getIt<WatchWalletsUseCase>()
      )..add(WalletsPageStartEvent()),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(context.tr(LocaleKeys.wallets)),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => onOpenSettings(context),
            )
          ]
        ),
        body: BlocBuilder<WalletsPageBloc, WalletsPageState>(
          builder: (context, state) {
            switch (state) {
              case WalletsPageDefaultState():
                configureCurWallet(state.wallets);
                return state.wallets.isEmpty 
                  ? buildPlaceholder()
                  : buildWallets(context, state.wallets);
              default: 
                return const Center(child: CircularProgressIndicator());
            }
          }
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: context.tr(LocaleKeys.addWallet),
          onPressed: onAddWallet,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildWallets(BuildContext context, List<Wallet> wallets) {
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
                  onDelete: () => onDeleteWallet(context, w.wid),
                  onTap: () => setCurWallet(w),
                  onHistoryButton: () => onOpenHistory(context),
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
          child: Text(context.tr(LocaleKeys.addFirstWalletHelperText), 
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