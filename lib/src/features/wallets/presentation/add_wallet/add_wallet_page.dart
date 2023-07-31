
import 'package:ads_pay_app/src/core/common/constants/constants.dart';
import 'package:ads_pay_app/services/database_service.dart';
import 'package:ads_pay_app/src/core/common/hardcoded.dart';
import 'package:ads_pay_app/src/features/wallets/infrastructure/data_sources/currency_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../get_it.dart';
import '../../domain/entities/currency.dart';
import '../../domain/entities/wallet.dart';


@RoutePage()
class AddWalletPage extends StatefulWidget {
  const AddWalletPage({Key? key}) : super(key: key);

  @override
  State<AddWalletPage> createState() => _AddWalletPageState();
}

class _AddWalletPageState extends State<AddWalletPage> {
  late DatabaseService dbServ;  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Wallet newWallet = Wallet.empty();

  @override
  void initState() {
    super.initState();
    dbServ = context.read<DatabaseService>();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Wallet'.hardcoded),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                h16gap,
                DropdownButtonFormField<Currency>(
                  onChanged: (cur) {
                    newWallet.currency = cur?.symbol ?? '';
                  },
                  validator: (cur) {
                    return newWallet.currency.isEmpty
                      ? 'Choose currency'.hardcoded
                      : null;
                  },
                  items: getIt<CurrencyProvider>().currencies.map(
                    (c) => DropdownMenuItem(
                      value: c, 
                      child: Text(c.toString())
                    )
                  ).toList(),
                  hint: Text('Currency'.hardcoded),
                  isExpanded: true,
                ),
                h16gap,
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (v) {
                    newWallet.amount = double.parse(v.replaceAll(',', '.'));
                  },
                  decoration: InputDecoration(
                    labelText: 'Amount'.hardcoded
                  ),
                ),
                h16gap,
                SizedBox(
                  height: 200,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,
                    maxLength: 255,
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    decoration: InputDecoration(
                      labelText: 'Description'.hardcoded,
                      alignLabelWithHint: true,
                    ),
                    onChanged: (v) {
                      newWallet.description = v;
                    },
                  ),
                ),
                h16gap,
                ElevatedButton(
                  child: Text('Add wallet'.hardcoded),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await dbServ.addWallet(newWallet);
                      if (mounted) Navigator.pop(context);
                    }
                  }
                )
              ]
            ),
          ),
        ),
      )
    );
  }
}