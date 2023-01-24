import 'package:belajar_termux/app/data/models/content_model.dart';
import 'package:belajar_termux/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ContentItemView extends GetView<HomeController> {
  Content content;
  ContentItemView({Key? key, required this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 150,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Material(
        color: const Color(0xff4a4a4a),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            controller.contentController.selectedContent.value = content;
            controller.contentController.update();
            Get.toNamed('/content-details');
          },
          borderRadius: BorderRadius.circular(12),
          child: Row(
            children: [
              Container(
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  image: DecorationImage(
                    image: AssetImage(content.image ?? ""),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "${content.name}",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width * 0.9 - 180,
                          child: Text(
                            "${content.desc}",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    if (content.tags != null)
                      Row(
                        children: [
                          Container(
                            height: 16,
                            width: 16,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            content.tags!.first,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
