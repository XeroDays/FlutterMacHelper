// ignore_for_file: depend_on_referenced_packages

import 'dart:math';
import 'package:flutter/material.dart';

import 'color.dart';

Color hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix: 16));
}

printer(data, {String title = ""}) {
  if (title.trim() != "") {
    print("--[$title]-->$data");
  } else {
    print("-->$data");
  }
}

unfocusKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

String getTempLink({int height = 200, int width = 200}) {
  Random rand = Random();
  int value = rand.nextInt(height);
  return 'https://picsum.photos/$width/$height?test=$value';
}

Widget circular({bool bearer = false}) {
  return WillPopScope(
    onWillPop: () async {
      return bearer;
    },
    child: Center(
      child: CircularProgressIndicator(
        color: Kprimary1,
      ),
    ),
  );
}

TextStyle myStyle(double size, bool isBold,
    {Color color = Colors.black, FontWeight overrideBold = FontWeight.bold}) {
  return TextStyle(
      fontSize: size,
      fontWeight: (isBold) ? overrideBold : FontWeight.normal,
      fontFamily: 'Inter',
      color: color);
}

// i have used the phone version ShowcasePRice... but somehow it remove one extra zero from it i dont know why
extension DoubleExtension on double {
  /// rounds the double to a specific decimal place
  double roundedPrecision(int places) {
    double mod = pow(10.0, places) as double;
    return ((this * mod).round().toDouble() / mod);
  }

  /// good for string output because it can remove trailing zeros
  /// and sometimes periods. Or optionally display the exact number of trailing
  /// zeros
  String roundedPrecisionToString(
    int places, {
    bool trailingZeros = false,
  }) {
    double mod = pow(10.0, places) as double;
    double round = ((this * mod).round().toDouble() / mod);
    String doubleToString =
        trailingZeros ? round.toStringAsFixed(places) : round.toString();
    if (!trailingZeros) {
      RegExp trailingZeros = RegExp(r'^[0-9]+.0+$');
      if (trailingZeros.hasMatch(doubleToString)) {
        doubleToString = doubleToString.split('.')[0];
      }
    }

    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    mathFunc(Match match) => '${match[1]},';

    return doubleToString.replaceAllMapped(reg, mathFunc);
  }
}

extension StringExtension on String {
  String stringcutTheCrap({int limiter = 30}) {
    return substring(0, ((length > limiter) ? limiter : length)) +
        ((length > limiter) ? "" : "");
  }

  String capitalize_custom() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
