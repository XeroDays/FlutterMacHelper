import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macos/constants/utils.dart';
import 'package:macos/controllers/home_controller.dart';
import 'package:macos/widgets/custom_buttons.dart';
import 'package:macos/widgets/custom_textfiled.dart';

class Home extends StatelessWidget {
  Home({super.key});

  HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Row(
            children: [
              Container(
                width: 400,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CustomTextField(
                    obsecureText: false,
                    labelName: "Class name",
                    controller: homeController.txtModelName),
              ),
              Row(
                children: [
                  Obx(() => Checkbox(
                      value: homeController.isNullable.value,
                      onChanged: (a) {
                        homeController.isNullable.value =
                            !homeController.isNullable.value;
                      })),
                  Text(
                    "Nullable",
                    style: myStyle(14, true, color: Colors.white),
                  )
                ],
              )
            ],
          ),
          textfields(size),
          CustomButton1(
            "Initiate Proc Module",
            onClick: () {
              unfocusKeyboard(context);
              homeController.initProc();
            },
          )
        ],
      ),
    );
  }

  Row textfields(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: size.height * 0.77,
          width: size.width * 0.4,
          child: CustomTextField(
            obsecureText: false,
            controller: homeController.txtattributes,
            labelName: "Attributes",
            lines: 50,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: size.height * 0.77,
          width: size.width * 0.6,
          child: CustomTextField(
            obsecureText: false,
            controller: homeController.txtcode,
            labelName: "Code",
            lines: 50,
          ),
        )
      ],
    );
  }
}
