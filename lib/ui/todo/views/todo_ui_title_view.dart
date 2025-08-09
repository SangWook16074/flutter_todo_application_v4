import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_application/ui/todo/viewModels/todo_list_view_model.dart';

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
        Consumer(
          builder: (context, ref, child) {
            final count = ref.watch(
              todoListViewModelProvider.select((it) => it.restTodoCount),
            );
            return Text(
              "$count 남음",
              style: TextStyle(
                color: Color(0xffafafaf),
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
              ),
            );
          },
        ),
      ],
    );
  }
}
