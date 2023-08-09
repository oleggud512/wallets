import 'dart:convert';

import 'package:ads_pay_app/src/features/wallets/domain/entities/currency.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../infrastructure/data_sources/currency_provider.dart';


@Singleton(as: CurrencyProvider)
class RootBundleCurrencyProviderImpl implements CurrencyProvider {
  @FactoryMethod(preResolve: true)
  static Future<CurrencyProvider> init() async {
    final curs = await getCurrencies();
    return RootBundleCurrencyProviderImpl(curs);
  }

  RootBundleCurrencyProviderImpl([
    List<Currency> currencies = const []
  ]) : _currencies = currencies;

  final List<Currency> _currencies;

  static Future<List<Currency>> getCurrencies() async {
    List<dynamic> data = jsonDecode(
      await rootBundle.loadString('assets/curs.json'));
    List<Currency> curs = data.map((cur) => Currency.fromJson(cur)).toList();
    curs.sort((a, b) => a.name.compareTo(b.name));
    return curs;
  }

  @override
  List<Currency> get currencies => _currencies;
}