
import 'package:ads_pay_app/src/core/common/constants/sizes.dart';
import 'package:ads_pay_app/services/database_service.dart';
import 'package:ads_pay_app/src/core/common/hardcoded.dart';
import 'package:ads_pay_app/src/features/wallets/infrastructure/data_sources/currency_provider.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/add_wallet/add_wallet_page_bloc.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/add_wallet/add_wallet_page_events.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/add_wallet/add_wallet_page_states.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../get_it.dart';
import '../../domain/entities/currency.dart';


@RoutePage()
class AddWalletPage extends StatefulWidget {
  const AddWalletPage({Key? key}) : super(key: key);

  @override
  State<AddWalletPage> createState() => _AddWalletPageState();
}

class _AddWalletPageState extends State<AddWalletPage> {
  late DatabaseService dbServ;  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    dbServ = context.read<DatabaseService>();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddWalletPageBloc(getIt()),
      child: BlocBuilder<AddWalletPageBloc, AddWalletPageState>(
        builder: (context, state) {
          final bloc = context.read<AddWalletPageBloc>();
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
                      // CURRENCY
                      DropdownButtonFormField<Currency>(
                        onChanged: (cur) {
                          bloc.add(AddWalletPageCurrencyChangedEvent(cur?.symbol ?? ''));
                        },
                        validator: (cur) {
                          return state.currency.isEmpty
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
                      // AMOUNT
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (v) {
                          bloc.add(AddWalletPageAmountChangedEvent(double.parse(v.replaceAll(',', '.'))));
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
                            bloc.add(AddWalletPageDescriptionChangedEvent(v));
                          },
                        ),
                      ),
                      h16gap,
                      FilledButton(
                        child: Text('Add wallet'.hardcoded),
                        onPressed: () async {
                          if (!formKey.currentState!.validate()) return;
    
                          bloc.add(AddWalletPageAddWalletEvent(() {
                            if (mounted) context.popRoute(); 
                          }));
                        }
                      )
                    ]
                  ),
                ),
              ),
            )
          );
        }
      ),
    );
  }
}