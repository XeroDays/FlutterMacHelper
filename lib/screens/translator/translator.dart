import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:macos/constants/color.dart';
import 'package:macos/screens/translator/translator_viewmodel.dart';
import 'package:macos/widgets/custom_buttons.dart';
import 'package:macos/widgets/custom_textfiled.dart';

import '../../constants/utils.dart';

class Translator extends StatelessWidget {
  Translator({super.key});
  final TranslatorViewModel viewModel = TranslatorViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text("Translator", style: myStyle(20, true, color: Kprimary1)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width * 0.5,
                  height: 50,
                  child: CustomTextField(
                      obsecureText: false,
                      controller: viewModel.txtLanguageCode,
                      labelName: "Langauge Code e.g. ( en | sp )"),
                ),
                Row(
                  children: [
                    Obx(() => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Words: ${viewModel.totalWords} ${viewModel.Status}",
                              style: myStyle(20, true,
                                  color: Color.fromARGB(255, 8, 186, 103)),
                            ),
                            Text(
                              "API Characters left: ${viewModel.totalLeft}",
                              style: myStyle(12, true,
                                  color: Color.fromARGB(255, 243, 48, 34)),
                            ),
                          ],
                        )),
                    SizedBox(width: 80),
                    IconButton(
                      hoverColor: Kprimary1,
                      icon: Icon(
                        Icons.map,
                        color: kwhite,
                      ),
                      onPressed: () async {
                        viewModel.initProcess();
                      },
                    ),
                    IconButton(
                      hoverColor: Kprimary1,
                      icon: Icon(
                        Icons.paste,
                        color: kwhite,
                      ),
                      onPressed: () async {
                        ClipboardData? data =
                            await Clipboard.getData('text/plain');
                        if (data != null) {
                          viewModel.txtMapData.text = data.text!;
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomTextField(
                obsecureText: false,
                lines: 25,
                controller: viewModel.txtMapData,
                labelName: "Enter map in this format\n'price': 'price'"),
            SizedBox(height: 20),
            CustomButton1(
              "Process",
              onClick: () {
                viewModel.initTranslate();
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
