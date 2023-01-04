import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:macos/constants/app_con.dart';
import 'package:macos/models/attribute_model.dart';
import 'package:macos/models/class_model.dart';

class HomeController extends GetxController {
  TextEditingController txtModelName = TextEditingController();
  TextEditingController txtattributes = TextEditingController();
  TextEditingController txtcode = TextEditingController();

  RxBool isNullable = false.obs;

  HomeController() {
    txtModelName.text = "DemoModel";
  }

  initProc() {
    String code = txtattributes.text.trim();

    List<String> lines = code.split("\n");

    if (lines.length <= 1) {
      showErrorSnackbar("Validation Error", "Invalid Attributes");
      return;
    }

    List<AttributeModel> attributes = filter1(lines);

    String name = txtModelName.text;
    ClassModel classModel = ClassModel(
        modelName: name, attributes: attributes, isNullable: isNullable.value);

    txtcode.text = classModel.getClassCode();
    Clipboard.setData(ClipboardData(text: txtcode.text));
    showSuccessSnackbar("Copied to  Clipboard", "Code is copied to clipboard");
  }

  List<AttributeModel> filter1(List<String> lines) {
    List<AttributeModel> liness = [];
    for (String line in lines) {
      String clean = line.replaceAll("late", "").trim();

      AttributeModel model = AttributeModel(
          type: clean.split(" ").first,
          name: clean.split(" ").last.replaceAll(";", ""));

      liness.add(model);
    }
    return liness;
  }
}
