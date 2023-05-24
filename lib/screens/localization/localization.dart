import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:macos/constants/app_con.dart';
import 'package:macos/screens/localization/localization_viewmodel.dart';
import 'package:macos/widgets/custom_buttons.dart';

import '../../constants/utils.dart';

class LocalizationHome extends StatelessWidget {
  LocalizationHome({super.key});

  final LocalizationViewModel viewmodel = LocalizationViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  customRow(viewmodel.txtCode, "Code"),
                  SizedBox(height: 10),
                  customRow(viewmodel.txtMaps, "Maps"),
                  SizedBox(height: 10),
                  customRow(viewmodel.txtalt1, "Alt 1"),
                  SizedBox(height: 10),
                  customRow(viewmodel.txtalt2, "Alt 2"),
                  SizedBox(height: 10),
                ],
              ),
            ),
            CustomButton1(
              "Process",
              onClick: () {
                viewmodel.process();
              },
            ),
            SizedBox(height: 20),
            Container(
              child: Text(
                "Features:\n 1. Get Data from clipboard.\n For Example \n 'Home Screen'\n\n 2.Process it. \n 3.Change it to map data.\n For Example \n 'home_screen' : 'Home Screen'\n\n 4. Paste it to clipboard.",
                style: myStyle(10, false, color: Colors.grey.shade700),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container customRow(TextEditingController controller, String prefix) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(20),
        ],
        onTap: () {
          //set clipboard
          Clipboard.setData(
            ClipboardData(
              text: controller.value.text,
            ),
          );
          showSuccessSnackbar("Added", "added to clipnboard");
        },
        keyboardType: TextInputType.number,
        controller: controller,
        style: myStyle(30, true, color: Colors.green.shade300),
        textAlign: TextAlign.center,
        showCursor: false,
        textInputAction: TextInputAction.go,
        enableInteractiveSelection: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          prefix: Text(
            prefix,
            style: myStyle(30, true, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
