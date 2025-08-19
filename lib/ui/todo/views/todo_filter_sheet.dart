import 'package:flutter/material.dart';
import 'package:flutter_todo_application/ui/todo/widgets/todo_filter_select_section.dart';
import 'package:flutter_todo_application/ui/todo/widgets/todo_filter_sheet_title_section.dart';

class TodoFilterSheet extends StatelessWidget {
  const TodoFilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TodoFilterSheetTitleSection(),
        SizedBox(height: 20),
        TodoFilterSelectSection(),
      ],
    );
  }
}
