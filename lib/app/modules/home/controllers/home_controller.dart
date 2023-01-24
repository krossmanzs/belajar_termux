import 'dart:convert';

import 'package:belajar_termux/app/controllers/content_controller.dart';
import 'package:belajar_termux/app/data/models/content_model.dart';
import 'package:belajar_termux/app/data/providers/content_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();
  final contentProvider = ContentProvider();
  final contentController = Get.find<ContentController>();
  final count = 0.obs;
  final searchText = "".obs;
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

  void increment() => count.value++;
}
