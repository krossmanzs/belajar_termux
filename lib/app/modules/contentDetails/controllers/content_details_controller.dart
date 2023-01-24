import 'package:belajar_termux/app/controllers/content_controller.dart';
import 'package:get/get.dart';

class ContentDetailsController extends GetxController {
  //TODO: Implement ContentDetailsController
  final contentController = Get.find<ContentController>();
  final count = 0.obs;
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
