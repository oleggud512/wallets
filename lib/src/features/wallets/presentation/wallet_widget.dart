import 'package:ads_pay_app/src/core/common/hardcoded.dart';
import 'package:ads_pay_app/src/features/wallets/domain/entities/wallet.dart';
import 'package:ads_pay_app/services/theme_service.dart';
import 'package:ads_pay_app/src/core/common/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../history/domain/entities/history_node.dart';
import '../../../core/presentation/edit_description_dialog.dart';
import 'transaction/transaction_page.dart';


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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      key: popupKey,
      tooltip: '',
      enabled: false,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 0,
            child: Text('edit'.hardcoded)
          ),
          PopupMenuItem(
            value: 1,
            child: Text('delete'.hardcoded)
          )
        ];
      },
      onSelected: (val) {
        if (val == 0) {
          showDialog(
            context: context,
            builder: (context) {
              return EditDescriptionDialog(
                description: widget.wallet.description,
                wid: widget.wallet.wid,
                editDescription: EditDescription.wallet,
              );
            }
          );
        } else if (val == 1) {
          if (widget.onDelete != null) widget.onDelete!();
        }
      },
      child: Card(
        margin: const EdgeInsets.all(0),
        // color: t.colorScheme.primary,
        child: InkWell(
          borderRadius: BorderRadius.circular(ThemeService.defaultPadding),
          onTap: () {
            widget.onTap();
          },
          onLongPress: () {
            popupKey.currentState!.showButtonMenu();
          },
          child: Padding(
            padding: const EdgeInsets.all(ThemeService.defaultPadding),
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
                      Text('${widget.wallet.amount} ${widget.wallet.currency}',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          // color: Theme.of(context).colorScheme.onPrimary
                        )
                      ),
                      if (widget.isSelected && widget.wallet.history.isNotEmpty) InkWell(
                        onTap: widget.onHistoryButton, 
                        borderRadius: BorderRadius.circular(10),
                        child: const Icon(Icons.history)
                      )
                    ],
                  ),
                  if (widget.wallet.description.isNotEmpty) Text(
                    widget.wallet.description,
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
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TransactionPage(
                                  action: WalletAction.add,
                                  wallet: widget.wallet
                                )
                              )
                            );
                          }, 
                          text: 'ADD'.hardcoded
                        ),
                        w16gap,
                        buildWalletActionButton(context, 
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TransactionPage(
                                  action: WalletAction.take,
                                  wallet: widget.wallet
                                )
                              )
                            );
                          }, 
                          text: 'TAKE'.hardcoded
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
          borderRadius: BorderRadius.circular(ThemeService.defaultPadding),
          color: t.colorScheme.primary,
          child: InkWell(
            borderRadius: BorderRadius.circular(ThemeService.defaultPadding),
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