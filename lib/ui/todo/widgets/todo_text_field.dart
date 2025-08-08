import 'package:flutter/material.dart';

class TodoTextField extends TextField {
  final String? hintLabel;

  TodoTextField({super.key, this.hintLabel = "할 일을 입력하세요.", super.onChanged})
    : super(
        cursorColor: Color(0xff000000),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffefefef),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.3, color: Color(0xff000000)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          isDense: true,
          hint: Text(hintLabel!),
        ),
      );
}
