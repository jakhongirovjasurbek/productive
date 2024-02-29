import 'dart:io';

// Replace all the IDS used below with the AD IDS you've created in Step 2.
class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3907854924980835/8941600104';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3907854924980835/6973912312';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3907854924980835/6040298113';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3907854924980835/6598755215';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3907854924980835/8750028411';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3907854924980835/4459677036';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedInterstitialAd {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3907854924980835/8558456727';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3907854924980835/4347748973';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3907854924980835/7277412067';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3907854924980835/8207350355';
    }
    throw UnsupportedError("Unsupported platform");
  }
}