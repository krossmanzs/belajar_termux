import 'package:belajar_termux/app/data/models/content_model.dart';
import 'package:belajar_termux/app/modules/contentDetails/controllers/content_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentationView extends GetView<ContentDetailsController> {
  const DocumentationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Content content = controller.contentController.selectedContent.value;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dokumentasi",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(12),
            width: MediaQuery.of(context).size.width * 0.9,
            color: const Color(0xff444444),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9 - 72,
                  child: Text(
                    content.documentation ?? "",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    const GetSnackBar snackBar = GetSnackBar(
                      message: "Coppied",
                      duration: Duration(
                        seconds: 1,
                      ),
                      animationDuration: Duration(
                        milliseconds: 200,
                      ),
                    );
                    Get.showSnackbar(snackBar);
                    Clipboard.setData(
                        ClipboardData(text: content.documentation));
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
