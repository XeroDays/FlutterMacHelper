import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:macos/constants/app_con.dart';
import 'package:macos/controllers/translator_api_controller.dart';

class TranslatorViewModel {
  Map<String, String> map = {};

  RxInt totalWords = 0.obs;
  RxInt totalLeft = 0.obs;
  RxString Status = "".obs;

  TextEditingController txtMapData = TextEditingController();
  TextEditingController txtLanguageCode = TextEditingController();

  TranslatorViewModel() {
    txtMapData.text =
        '"price":"price",\n"my name is idreres":"my name is idrees"';
    txtLanguageCode.text = 'en';
  }
  initProcess() {
    String text = txtMapData.text.trim().replaceAll('\n', '');

    List<String> lines = text.split(",");

    //remove emptry items from lines
    lines.removeWhere((element) => element.trim().isEmpty);

    //split every line by : in lines
    List<String> newLines = [];
    for (String one in lines) {
      List<String> temp = one.split(":");
      if (temp.length == 2) {
        String code = temp[0].trim();

        String value = temp[1].trim();

        //remove first and last char from code
        code = code.trim();
        value = value.substring(1, value.length - 1);
        map[code] = value;
        newLines.add(code);
      }
    }

    totalWords.value = 0;
    for (String key in map.keys) {
      totalWords.value += map[key]!.length;
    }
  }

  initTranslate() async {
    ClipboardData? clipData = await Clipboard.getData('text/plain');
    if (clipData != null) {
      txtMapData.text = clipData.text!;
    }

    map.clear();
    Status.value = "";
    totalLeft.value = 0;
    totalWords.value = 0;

    initProcess();

    TranslateAPIController translator = TranslateAPIController();

    int total = 0;
    for (String key in map.keys) {
      String code = key;
      String data = map[key]!;
      total++;

      Status.value = "$total / ${map.keys.length}";
      TranslationResponse model =
          await translator.translate(data, txtLanguageCode.text.trim());
      totalWords.value -= model.limit_used!.toInt();
      totalLeft.value = model.limit_remaining!.toInt();

      map[code] = model.translation!;
    }

    String data = '';
    for (String key in map.keys) {
      data += '$key:"${map[key]}",\n';
    }
    txtMapData.text = data;

    Clipboard.setData(ClipboardData(text: data));

    showSuccessSnackbar("Successfully done", "Data is saved into clipboard");
  }
}
