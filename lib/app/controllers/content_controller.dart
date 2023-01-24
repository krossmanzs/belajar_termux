import 'dart:convert';

import 'package:belajar_termux/app/data/models/content_model.dart';
import 'package:belajar_termux/app/data/providers/content_provider.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ContentController extends GetxController {
  //TODO: Implement ContentController

  final count = 0.obs;
  Rx<List<Content>> contents = Rx([]);
  final contentProvider = ContentProvider();
  Rx<Content> selectedContent = Rx(Content());
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    init();
    ever(contents, _handleLoading);
  }

  _handleLoading(List<Content> ctn) async {
    if (ctn.isNotEmpty) {
      Get.offNamed('/home');
    } else {
      Get.offNamed('/loading');
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<Map<String, String>> readJson() async {
    try {
      final String response =
          await rootBundle.loadString('assets/contentlist.json');
      print(response);

      Map<String, String> data =
          new Map<String, String>.from(json.decode(response));
      print(data);
      return data;
    } catch (e) {
      print(e);
      return {};
    }
  }

  init() async {
    Map<String, String> data = await readJson();
    data.forEach((key, value) async {
      final content = await contentProvider.readJson(value);
      contents.value = [...contents.value, content];
      update();
    });
  }

  void increment() => count.value++;
}
