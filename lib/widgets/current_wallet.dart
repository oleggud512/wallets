import 'package:flutter/material.dart';

import '../constants.dart';
import '../functions.dart';
import '../models/account.dart';
import '../models/wallet.dart';

class CurrentWallet extends StatefulWidget {
  const CurrentWallet({
    Key? key,
    required this.curWallet,
    required this.account
  }) : super(key: key);

  final Wallet? curWallet;
  final Account account;

  @override
  State<CurrentWallet> createState() => _CurrentWalletState();
}

class _CurrentWalletState extends State<CurrentWallet> {

  @override
  Widget build(BuildContext context) {
    var t = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: '${widget.curWallet?.amount.toStringAsFixed(2) ?? '00.00'} ',
                  style: t.textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                  children: [
                    TextSpan(
                      text: widget.curWallet?.currency ?? "",
                      style: t.textTheme.displaySmall
                    )
                  ]
                )
              )
            )
          ),
          hgh(defaultPadding),
        ]
      ),
    );
  }
}