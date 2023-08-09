
import 'package:ads_pay_app/src/core/common/constants/sizes.dart';
import 'package:ads_pay_app/src/core/presentation/localization/locale_keys.g.dart';
import 'package:ads_pay_app/src/features/wallets/infrastructure/data_sources/currency_provider.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/add_wallet/add_wallet_page_bloc.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/add_wallet/add_wallet_page_events.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/add_wallet/add_wallet_page_states.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../get_it.dart';
import '../../domain/entities/currency.dart';


@RoutePage()
class AddWalletPage extends StatefulWidget {
  const AddWalletPage({Key? key}) : super(key: key);

  @override
  State<AddWalletPage> createState() => _AddWalletPageState();
}

class _AddWalletPageState extends State<AddWalletPage> {
  final formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddWalletPageBloc(getIt()),
      child: BlocBuilder<AddWalletPageBloc, AddWalletPageState>(
        builder: (context, state) {
          final bloc = context.read<AddWalletPageBloc>();
          return Scaffold(
            appBar: AppBar(
              title: Text(context.tr(LocaleKeys.addWallet)),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: p8),
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
                            ? context.tr(LocaleKeys.chooseCurrency)
                            : null;
                        },
                        items: getIt<CurrencyProvider>().currencies.map(
                          (c) => DropdownMenuItem(
                            value: c,
                            child: Text(c.toString())
                          )
                        ).toList(),
                        hint: Text(context.tr(LocaleKeys.currency)),
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
                          labelText: context.tr(LocaleKeys.amount)
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
                            labelText: context.tr(LocaleKeys.description),
                            alignLabelWithHint: true,
                          ),
                          onChanged: (v) {
                            bloc.add(AddWalletPageDescriptionChangedEvent(v));
                          },
                        ),
                      ),
                      h16gap,
                      FilledButton(
                        child: Text(context.tr(LocaleKeys.addWallet)),
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