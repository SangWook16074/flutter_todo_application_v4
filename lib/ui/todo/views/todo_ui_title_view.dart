import 'package:flutter/material.dart';

class TodoUITitleView extends StatelessWidget {
  const TodoUITitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "할 일",
          style: TextStyle(
            color: Color(0xff000000),
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
