import 'package:belajar_termux/app/data/models/content_model.dart';
import 'package:belajar_termux/app/modules/contentDetails/controllers/content_details_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ContentDescriptionView extends GetView<ContentDetailsController> {
  const ContentDescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Content content = controller.contentController.selectedContent.value;
    return Container(
        child: Column(
      children: [
        Container(
          margin:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
          alignment: Alignment.centerLeft,
          child: Text(
            "Deskripsi",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            content.desc ?? "",
            style: GoogleFonts.lato(
              color: Colors.white,
            ),
          ),
        ),
      ],
    ));
  }
}
