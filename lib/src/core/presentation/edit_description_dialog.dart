import 'package:ads_pay_app/src/core/common/extensions/string.dart';
import 'package:ads_pay_app/src/core/presentation/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'dialog_widget.dart';


class EditDescriptionDialog extends StatefulWidget with DialogWidget<String> {
  const EditDescriptionDialog({
    super.key,
    required this.description,
  });

  final String description;

  @override
  State<EditDescriptionDialog> createState() => _EditDescriptionDialogState();
}

class _EditDescriptionDialogState extends State<EditDescriptionDialog> {
  TextEditingController descrCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    descrCont.text = widget.description;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(20),
      content: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 280
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              child: TextFormField(
                autofocus: true,
                controller: descrCont,
                textAlignVertical: TextAlignVertical.top,
                maxLength: 255,
                expands: true,
                maxLines: null,
                minLines: null,
                decoration: InputDecoration(
                  labelText: context.tr(LocaleKeys.description),
                  alignLabelWithHint: true,
                ),
              ),
            ),
            FilledButton(
              child: Text(context.tr(LocaleKeys.save)),
              onPressed: () {
                Navigator.pop(context, descrCont.text);
              },
            )
          ]
        ),
      )
    );
  }
}