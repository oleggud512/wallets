import 'package:ads_pay_app/src/features/wallets/domain/entities/currency.dart';

abstract interface class CurrencyProvider {
  List<Currency> get currencies;
}