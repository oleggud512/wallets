import 'package:ads_pay_app/src/core/common/extensions/string.dart';
import 'package:flutter/material.dart';

class YesNoDialog extends StatelessWidget {
  const YesNoDialog({
    super.key,
    this.message = ''
  });

  final String message;

  Future<bool?> show(BuildContext context) {
    return showDialog(context: context, builder: (context) => this);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            child: Text('NO'.hardcoded),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          FilledButton(
            child: Text('YES'.hardcoded),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ]
      );
  }
}