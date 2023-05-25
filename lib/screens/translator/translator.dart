import 'package:flutter/material.dart';
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
            Container(
                child: Text("Translator",
                    style: myStyle(20, true, color: Kprimary1))),
            SizedBox(height: 20),
            CustomTextField(
                obsecureText: false,
                labelName: "Langauge Code e.g. ( en | sp )"),
            SizedBox(height: 20),
            CustomTextField(
                obsecureText: false, lines: 15, labelName: "enter map"),
            SizedBox(height: 20),
            CustomButton1(
              "Process",
              onClick: () {
                viewModel.initProcess();
              },
            )
          ],
        ),
      ),
    );
  }
}
