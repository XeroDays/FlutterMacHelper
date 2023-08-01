import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macos/constants/utils.dart';
import 'package:macos/screens/code_helper/code_helper.dart';
import 'package:macos/screens/code_helper/code_helper_viewmodel.dart';
import 'package:macos/screens/image_resizer/image_resizer.dart';
import 'package:macos/screens/localization/localization.dart';
import 'package:macos/screens/translator/translator.dart';
import 'package:macos/widgets/custom_buttons.dart';
import 'package:macos/widgets/custom_textfiled.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                "Artificial Intelligence Helper",
                style: myStyle(33, true, color: Colors.white),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              children: [
                SizedBox(height: 15),
                CustomButton1("Code Helper", onClick: () {
                  Get.to(() => CodeHelper());
                }),
                SizedBox(height: 15),
                CustomButton1("Localization Helper", onClick: () {
                  Get.to(() => LocalizationHome());
                }),
                SizedBox(height: 15),
                CustomButton1("Map<> Language Translator", onClick: () {
                  Get.to(() => Translator());
                }),
                SizedBox(height: 15),
                CustomButton1("Image Resizer", onClick: () {
                  Get.to(() => ImageResizer());
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
