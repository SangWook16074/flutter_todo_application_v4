import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_application/data/models/todo.dart';
import 'package:flutter_todo_application/ui/todo/viewModels/todo_list_view_model.dart';
import 'package:flutter_todo_application/ui/todo/views/todo_title_update_sheet.dart';

class TodoEditSheet extends ConsumerWidget {
  final Todo todo;
  const TodoEditSheet({super.key, required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListViewModel = ref.read(todoListViewModelProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => TodoTitleUpdateSheet(todo: todo),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "수정",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              todoListViewModel.deleteTodo(todo.id);
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),

              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                alignment: Alignment.center,

                child: Text(
                  "삭제",
                  style: TextStyle(
                    color: Color(0xffff0000),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
