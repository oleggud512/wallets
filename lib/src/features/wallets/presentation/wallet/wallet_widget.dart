import 'package:ads_pay_app/src/core/presentation/localization/locale_keys.g.dart';
import 'package:ads_pay_app/src/features/wallets/application/use_cases/update_wallet_description.dart';
import 'package:ads_pay_app/src/features/wallets/domain/entities/wallet.dart';
import 'package:ads_pay_app/src/core/common/constants/sizes.dart';
import 'package:ads_pay_app/src/get_it.dart';
import 'package:ads_pay_app/src/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../history/domain/entities/history_node.dart';
import '../../../../core/presentation/edit_description_dialog.dart';


class WalletWidget extends StatefulWidget {

  const WalletWidget({
    Key? key,
    required this.wallet,
    required this.onTap,
    this.onDelete,
    required this.isSelected,
    required this.onHistoryButton,
  }) : super(key: key);

  final Wallet wallet;
  final void Function() onTap;
  final void Function()? onDelete;
  final void Function() onHistoryButton;
  final bool isSelected;

  @override
  State<WalletWidget> createState() => _WalletWidgetState();
}

class _WalletWidgetState extends State<WalletWidget> {
  GlobalKey<PopupMenuButtonState> popupKey = GlobalKey<PopupMenuButtonState>();

  double? curHeight;
  GlobalKey contKey = GlobalKey();
  Wallet get wallet => widget.wallet;

  @override
  void initState() {
    super.initState();
  }

  Future<void> editWalletDescription() async {
    final newDescr = await EditDescriptionDialog(
      description: wallet.description,
    ).show(context);
    if (newDescr == null) return;
    getIt.hardcoded<UpdateWalletDescriptionUseCase>()(wallet.wid, newDescr);
  }

  void onDeleteWallet() {
    if (widget.onDelete != null) widget.onDelete!();
  }

  void onAddFunds() async {
    await context.pushRoute(TransactionRoute(
      action: WalletAction.add, 
      wallet: widget.wallet
    ));
  }

  void onTakeFunds() async {
    await context.pushRoute(TransactionRoute(
      action: WalletAction.take, 
      wallet: widget.wallet
    ));
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Symbol>(
      key: popupKey,
      tooltip: '',
      enabled: false,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: #edit,
            child: Text(context.tr(LocaleKeys.edit)),
          ),
          PopupMenuItem(
            value: #delete,
            child: Text(context.tr(LocaleKeys.delete)),
          )
        ];
      },
      onSelected: (i) {
        if (i == #edit) editWalletDescription();
        if (i == #delete) onDeleteWallet();
      },
      child: Card(
        margin: EdgeInsets.zero,
        child: InkWell(
          borderRadius: BorderRadius.circular(p8),
          onTap: () {
            widget.onTap();
          },
          onLongPress: () {
            popupKey.currentState!.showButtonMenu();
          },
          child: Padding(
            padding: const EdgeInsets.all(p8),
            child: AnimatedSize(
              curve: Curves.fastOutSlowIn,
              alignment: Alignment.topCenter,
              duration: const Duration(milliseconds: 300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${wallet.amount} ${wallet.currency}',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          // color: Theme.of(context).colorScheme.onPrimary
                        )
                      ),
                      if (widget.isSelected && wallet.history.isNotEmpty) InkWell(
                        onTap: widget.onHistoryButton, 
                        borderRadius: BorderRadius.circular(10),
                        child: const Icon(Icons.history)
                      )
                    ],
                  ),
                  if (wallet.description.isNotEmpty) Text(
                    wallet.description,
                    overflow: widget.isSelected
                      ? TextOverflow.clip
                      : TextOverflow.ellipsis,
                  ),
                  if (widget.isSelected) ...[
                    h16gap,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildWalletActionButton(context, 
                          onPressed: onAddFunds, 
                          text: context.tr(LocaleKeys.add)
                        ),
                        w16gap,
                        buildWalletActionButton(context, 
                          onPressed: onTakeFunds, 
                          text: context.tr(LocaleKeys.take)
                        ),
                      ],
                    )
                  ]
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildWalletActionButton(BuildContext context, {
      required onPressed, 
      required text
  }) {
    var t = Theme.of(context);
    return Expanded(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 20,
          maxHeight: 20,
        ),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(p8),
          color: t.colorScheme.primary,
          child: InkWell(
            borderRadius: BorderRadius.circular(p8),
            onTap: onPressed,
            child: Center(
              child: Text(text,
                style: TextStyle(color: t.buttonTheme.colorScheme?.onPrimary)
              ),
            )
          )
        ),
      ),
    );
  }
}