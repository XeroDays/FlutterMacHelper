import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:macos/constants/app_con.dart';
import 'package:macos/constants/utils.dart';

class LocalizationViewModel {
  RxString code = "".obs;
  RxString result = "".obs;

  TextEditingController txtCode = TextEditingController();
  TextEditingController txtMaps = TextEditingController();
  TextEditingController txtalt1 = TextEditingController();

  process() {
    String clipDaata = "";

    Clipboard.getData("text/plain").then((value) {
      clipDaata = value!.text!;
      print(clipDaata);

      code.value = clipDaata.replaceAll(RegExp(r'[^\w\s]+'), '');
      printer(code);

      code.value = code.trim();
      code.value = code.replaceAll(' ', "_");
      code.value = code.toLowerCase();
      txtCode.text = code.value;
      String resultt = "'${code.value}' : '$clipDaata',";
      result.value = resultt;
      txtalt1.text = "'${code.value}'.tr";
      txtMaps.text = resultt;

      Clipboard.setData(ClipboardData(text: "$resultt\n"));
      showSuccessSnackbar("Success", "Added to map");
      printer(result);
    });
  }
}
