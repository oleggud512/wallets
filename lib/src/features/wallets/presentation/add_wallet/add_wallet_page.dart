
import 'package:ads_pay_app/src/core/common/constants/constants.dart';
import 'package:ads_pay_app/services/database_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/currency.dart';
import '../../domain/entities/wallet.dart';
import '../../../../../services/currency_service.dart';


@RoutePage()
class AddWalletPage extends StatefulWidget {
  const AddWalletPage({Key? key}) : super(key: key);

  @override
  State<AddWalletPage> createState() => _AddWalletPageState();
}

class _AddWalletPageState extends State<AddWalletPage> {
  late DatabaseService dbServ;  
  late CurrencyService curServ;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Wallet newWallet = Wallet.empty();

  @override
  void initState() {
    super.initState();
    dbServ = context.read<DatabaseService>();
    curServ = context.read<CurrencyService>();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Wallet')
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
                FutureBuilder<List<Currency>>(
                  future: curServ.currenciesFuture,
                  builder: (context, snapshot) {
                    return DropdownButtonFormField<Currency>(
                      onChanged: snapshot.hasData ? (cur) {
                        newWallet.currency = cur?.symbol ?? '';
                      } : null,
                      validator: (cur) {
                        return newWallet.currency.isEmpty
                          ? 'Choose currency'
                          : null;
                      },
                      items: snapshot.hasData ? [
                        for (Currency cur in snapshot.data!) DropdownMenuItem(
                          value: cur,
                          child: Text(cur.toString())
                        )
                      ] : [],
                      hint: const Text('Currency'),
                      isExpanded: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    );
                  }
                ),
                h16gap,
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (v) {
                    newWallet.amount = double.parse(v.replaceAll(',', '.'));
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Amount'
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                      alignLabelWithHint: true,
                    ),
                    onChanged: (v) {
                      newWallet.description = v;
                    },
                  ),
                ),
                h16gap,
                ElevatedButton(
                  child: const Text('Add wallet'),
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