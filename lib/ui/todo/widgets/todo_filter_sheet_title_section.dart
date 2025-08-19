import 'package:flutter/material.dart';
import 'package:flutter_todo_application/core/components/sheet_close_button.dart';

class TodoFilterSheetTitleSection extends StatelessWidget {
  const TodoFilterSheetTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '필터 및 옵션',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff000000),
          ),
        ),
        SheetCloseButton(
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
