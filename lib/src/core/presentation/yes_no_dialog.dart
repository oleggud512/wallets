import 'package:ads_pay_app/src/core/presentation/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'dialog_widget.dart';

class YesNoDialog extends StatelessWidget with DialogWidget<bool> {

  const YesNoDialog({
    super.key,
    this.message = ''
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            child: Text(context.tr(LocaleKeys.no)),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          FilledButton(
            child: Text(context.tr(LocaleKeys.yes)),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ]
      );
  }
}