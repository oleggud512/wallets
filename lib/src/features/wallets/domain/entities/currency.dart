class Currency {
  String name;
  String symbol;
  String code;

  Currency({
    required this.name,
    required this.symbol,
    required this.code
  });

  @override
  String toString() {
    return '$name ($code${symbol != code ? '/$symbol' : ''})';
  }

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      name: json['name'],
      code: json['code'],
      symbol: json['symbol']
    );
  }
}