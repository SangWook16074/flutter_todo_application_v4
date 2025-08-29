import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_application/data/models/todo.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_list_bloc.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_list_event.dart';

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
              context.read<TodoListBloc>().add(
                TodoListTodoDeleted(id: todo.id!),
              );
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
