class PrefsStrings {
  static const String themeMode = 'theme-mode';
  static const String currentLocale = 'current-locale';
} 

class FirebaseStrings {
  static const String amount = 'amount';
  static const String wallets = 'wallets';
  static const String tags = 'tags';
  static const String accounts = 'accounts';
  static const String history = 'history';

  static const String lastUpdated = 'last-updated';
  static const String date = 'date';
  static const String description = 'description';

  static String walletDescription(String wid) {
    return '$wallets/$wid/$description';
  }

  static String historyNodeDescription(String wid, String hid) {
    return '${historyNode(wid, hid)}/$description';
  }

  static String historyNode(String wid, String hid) {
    return '$wallets/$wid/$history/$hid';
  }

  static String historyOf(String walletId) {
    return '$wallets/$walletId/$history';
  }

  static String account(String id) {
    return '$accounts/$id';
  }

  static String tag(String name) {
    return '$tags/$name';
  }

  static String wallet(String id) {
    return '$wallets/$id';
  }
}

class LocalizationStrings {
  static const String enLocaleCode = 'en';
  static const String ruLocaleCode = 'ru';
}