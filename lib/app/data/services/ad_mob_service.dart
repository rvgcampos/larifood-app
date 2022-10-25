// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AdMobService {
//   static String? get bannerAdUnitId {
//     if (Platform.isAndroid) {
//       return 'ca-app-pub-9205334829563493/5012722445';
//     }
//   }

//   static final BannerAdListener bannerAdListener = BannerAdListener(
//     onAdLoaded: (ad) => debugPrint('Ad loaded.'),
//     onAdFailedToLoad: (ad, error) {
//       ad.dispose();
//       debugPrint('Ad failed to load: $error');
//     },
//     onAdOpened: (ad) => debugPrint('Ad opened.'),
//     onAdClosed: (ad) => debugPrint('Ad closed.'),
//   );
// }
