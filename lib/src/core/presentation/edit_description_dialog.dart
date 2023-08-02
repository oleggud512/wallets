import 'package:ads_pay_app/src/core/common/hardcoded.dart';
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
                  labelText: 'Description'.hardcoded,
                  alignLabelWithHint: true,
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Save'.hardcoded),
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