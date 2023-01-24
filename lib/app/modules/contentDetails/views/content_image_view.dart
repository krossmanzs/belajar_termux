import 'package:belajar_termux/app/modules/contentDetails/controllers/content_details_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ContentImageView extends GetView<ContentDetailsController> {
  const ContentImageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(
              controller.contentController.selectedContent.value.image ?? ""),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
