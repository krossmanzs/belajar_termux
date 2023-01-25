import 'package:belajar_termux/app/controllers/ads_controller.dart';
import 'package:belajar_termux/app/controllers/content_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(ContentController());
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  Get.put(AdsController());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
