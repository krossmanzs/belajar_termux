import 'package:belajar_termux/app/modules/home/controllers/home_controller.dart';
import 'package:belajar_termux/app/modules/home/views/content_item_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ContentListView extends GetView<HomeController> {
  const ContentListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: (controller.contentController.contents.value.where(
          (element) => (element.name!
                  .toLowerCase()
                  .contains(controller.searchText.toLowerCase()) ||
              element.tags!.contains(controller.searchText.value)),
        )).map((content) {
          return ContentItemView(
            content: content,
          );
        }).toList(),
      );
    });
  }
}
