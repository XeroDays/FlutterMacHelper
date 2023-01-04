// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final bool obsecureText;
  final String labelName;
  final bool ready;
  final int lines;
  final bool isNumeric;
  final int? maxLimit;
  final TextEditingController? controller;
  String? imageUrl;
  Function? onIconClick;
  CustomTextField(
      {Key? key,
      required this.obsecureText,
      this.imageUrl = '',
      required this.labelName,
      this.controller,
      this.lines = 1,
      this.ready = false,
      this.isNumeric = false,
      this.maxLimit,
      this.onIconClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              maxLines: obsecureText ? 1 : lines,
              controller: controller,
              maxLength: maxLimit,
              obscureText: obsecureText,
              readOnly: ready,
              keyboardType: isNumeric ? TextInputType.number : null,
              inputFormatters:
                  isNumeric ? [FilteringTextInputFormatter.digitsOnly] : [],
              style: TextStyle(
                  color: ready ? Colors.grey.shade600 : Colors.grey.shade900),
              decoration: InputDecoration(
                filled: true,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                // labelText: LabelName,
                hintText: labelName,
                hintStyle: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Inter',
                  color: Color(0xff000000),
                ),

                fillColor: const Color(0xffF6F6F6),
              ),
            ),
          ),
          imageUrl == ''
              ? Container()
              : InkWell(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {
                    onIconClick?.call();
                  },
                  child: SizedBox(
                    width: 30,
                    child: Image.asset(
                      '$imageUrl',
                    ),
                  ),
                ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
