import 'package:flutter/material.dart';

class LoadingDialog<T> extends StatelessWidget {
  const LoadingDialog({
    super.key,
    required this.task
  });

  final Future<T> task;

  /// shows a dialog, and closes it when the task is resolved.
  Future<T?> show(BuildContext context) {
    return showDialog(
      context: context, 
      builder: (context) {
        task.then((value) {
          // Navigator.pop(context, value);
          Future.delayed(const Duration(seconds: 3), () => Navigator.pop(context, value));
        });
        return this;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox.fromSize(
        size: const Size(100, 100),
        child: const Center(
          child: CircularProgressIndicator()
        )
      ),
    );
  }
}