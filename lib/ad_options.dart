import 'dart:io';

class AdDefaultOptions {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      print('AdDefaultOptions: bannerAdUnitId isAndroid');
      return 'ca-app-pub-6399403413008664/6632898280';
    } else if (Platform.isIOS) {
      print('AdDefaultOptions: bannerAdUnitId isIOS');
      return 'ca-app-pub-6399403413008664/8121826505';
    } else {
      throw UnsupportedError('AdDefaultOptions: Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6399403413008664/2258824419';
    } else if (Platform.isIOS) {
      return '';
    } else {
      throw UnsupportedError('AdDefaultOptions: Unsupported platform');
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return '<YOUR_ANDROID_INTERSTITIAL_AD_UNIT_ID>';
    } else if (Platform.isIOS) {
      return '<YOUR_IOS_INTERSTITIAL_AD_UNIT_ID>';
    } else {
      throw UnsupportedError('AdDefaultOptions: Unsupported platform');
    }
  }
}