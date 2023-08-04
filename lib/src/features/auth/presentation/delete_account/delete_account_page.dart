import 'package:ads_pay_app/src/core/common/context_ext.dart';
import 'package:ads_pay_app/src/core/common/hardcoded.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Delete account'.hardcoded, style: context.textTheme!.displayMedium),
          
        ]
      )
    );
  }
}