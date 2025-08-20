import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_application/data/models/todo.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_list_bloc.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_list_event.dart';
import 'package:flutter_todo_application/ui/todo/pages/todo_update_page.dart';
import 'package:flutter_todo_application/ui/todo/views/todo_title_update_sheet.dart';

class TodoEditSheet extends StatelessWidget {
  final Todo todo;
  const TodoEditSheet({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
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
                builder: (context) => SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: TodoUpdatePage(todo: todo),
                  ),
                ),
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
              context.read<TodoListBloc>().add(TodoListTodoDeleted(todo: todo));
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
