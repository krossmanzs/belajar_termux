import 'package:belajar_termux/app/controllers/ads_controller.dart';
import 'package:belajar_termux/app/controllers/content_controller.dart';
import 'package:get/get.dart';

class ContentDetailsController extends GetxController {
  //TODO: Implement ContentDetailsController
  final contentController = Get.find<ContentController>();
  final adsController = Get.find<AdsController>();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    adsController.bannerAds.load;
  }

  @override
  void onReady() {
    super.onReady();
    if (adsController.showedAds.value < 3) {
      adsController.initInterstitial().then((value) {
        if (adsController.interstitialAd.value != null) {
          adsController.interstitialAd.value!.show();
        }
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
