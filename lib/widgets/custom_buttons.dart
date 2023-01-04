// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../constants/utils.dart';

class CustomButton1 extends StatelessWidget {
  String title;
  Function? onClick;

  CustomButton1(this.title, {this.onClick});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        onClick?.call();
      },
      child: Container(
        height: 55,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            title,
            style: myStyle(16, false, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  String title;

  CustomButton2(this.title);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 55,
      width: size.width,
      decoration: BoxDecoration(
          border: Border.all(color: Kprimary1),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          title,
          style: myStyle(16, false, color: Kprimary1),
        ),
      ),
    );
  }
}
