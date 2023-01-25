import 'package:belajar_termux/app/modules/contentDetails/views/content_description_view.dart';
import 'package:belajar_termux/app/modules/contentDetails/views/content_how_to_use_view.dart';
import 'package:belajar_termux/app/modules/contentDetails/views/content_image_view.dart';
import 'package:belajar_termux/app/modules/contentDetails/views/content_install_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../controllers/content_details_controller.dart';

class ContentDetailsView extends GetView<ContentDetailsController> {
  const ContentDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff252525),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  BackButton(
                    onPressed: () => Get.back(),
                    color: Colors.white,
                  ),
                  Text(
                    controller.contentController.selectedContent.value.name ??
                        "Content title",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ContentImageView(),
              const SizedBox(height: 20),
              ContentDescriptionView(),
              const SizedBox(height: 20),
              ContentInstallView(),
              const SizedBox(height: 10),
              FutureBuilder(
                future: controller.adsController.bannerAds.load(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      alignment: Alignment.center,
                      width: controller.adsController.bannerAds.size.width
                          .toDouble(),
                      height: controller.adsController.bannerAds.size.height
                          .toDouble(),
                      child: AdWidget(ad: controller.adsController.bannerAds),
                    );
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(height: 10),
              ContentHowToUseView(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
