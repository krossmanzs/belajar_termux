import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsController extends GetxController {
  //TODO: Implement AdsController
  Rx<InterstitialAd?> interstitialAd = Rx(null);
  final count = 0.obs;
  final showedAds = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future initInterstitial() async {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/1033173712',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            interstitialAd.value = ad;
            if (interstitialAd.value != null) {
              interstitialAd.value!.fullScreenContentCallback =
                  FullScreenContentCallback(
                onAdShowedFullScreenContent: (InterstitialAd ad) {
                  print('%ad onAdShowedFullScreenContent.');
                  showedAds.value++;
                },
                onAdDismissedFullScreenContent: (InterstitialAd ad) {
                  print('$ad onAdDismissedFullScreenContent.');
                  ad.dispose();
                },
                onAdFailedToShowFullScreenContent:
                    (InterstitialAd ad, AdError error) {
                  print('$ad onAdFailedToShowFullScreenContent: $error');
                  ad.dispose();
                },
                onAdImpression: (InterstitialAd ad) =>
                    print('$ad impression occurred.'),
              );
            }
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  final BannerAd bannerAds = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (Ad ad) {
          print('Ad loaded.');
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // Dispose the ad here to free resources.
          ad.dispose();
          print('Ad failed to load: $error');
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) => print('Ad opened.'),
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) => print('Ad closed.'),
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) => print('Ad impression.'),
      ),
      request: AdRequest());
}
