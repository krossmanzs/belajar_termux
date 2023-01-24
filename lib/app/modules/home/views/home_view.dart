import 'package:belajar_termux/app/modules/home/views/content_item_view.dart';
import 'package:belajar_termux/app/modules/home/views/content_list_view.dart';
import 'package:belajar_termux/app/modules/home/views/search_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xff252525),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(14),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Belajar Termux",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SearchView(),
              const SizedBox(height: 20),
              ContentListView(),
            ],
          ),
        )),
      ),
    ));
  }
}
