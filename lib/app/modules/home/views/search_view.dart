import 'package:belajar_termux/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SearchView extends GetView<HomeController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextField(
        focusNode: controller.searchFocusNode,
        controller: controller.searchController,
        onChanged: (value) {
          controller.searchText.value = value;
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "search",
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
    );
  }
}
