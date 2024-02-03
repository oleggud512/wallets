import 'package:ads_pay_app/src/core/common/dialog_widget.dart';
import 'package:flutter/material.dart';

import '../../common/constants/sizes.dart';

class LoadingDialog<T> extends StatelessWidget with DialogWidget<T> {
  const LoadingDialog({
    super.key,
    required this.task
  });

  final Future<T> task;

  /// shows a dialog, and closes it when the task is resolved.
  @override
  Future<T?> show(BuildContext context) {
    return showDialog(
      context: context, 
      builder: (context) {
        task.then((value) async {
          Navigator.pop(context, value);
        });
        return this;
      }
    );
  }



  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(p16)),
      child: SizedBox.fromSize(
        size: const Size(p96, p96),
        child: const Center(
          child: CircularProgressIndicator()
        )
      ),
    );
  }
}