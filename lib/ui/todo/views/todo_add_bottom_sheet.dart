import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_application/data/models/todo.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_list.dart';
import 'package:flutter_todo_application/ui/todo/widgets/todo_text_field.dart';
import 'package:uuid/uuid.dart';

import '../blocs/todo_create.dart';

class TodoAddBottomSheet extends StatelessWidget {
  const TodoAddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "새로운 할 일 추가",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(Icons.close, size: 20, color: Color(0xffafafaf)),
              ),
            ],
          ),
        ),
        BlocBuilder<TodoCreateBloc, TodoCreateState>(
          builder: (context, state) {
            return TodoTextField(
              onChanged: (title) => context.read<TodoCreateBloc>().add(
                TodoCreateTodoTitleChanged(title: title),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    foregroundColor: Color(0xff000000),
                  ),
                  child: Text("취소"),
                ),
              ),
              Expanded(
                child: BlocSelector<TodoCreateBloc, TodoCreateState, bool>(
                  selector: (state) {
                    return state.title.isEmpty;
                  },
                  builder: (context, isTitleEmpty) {
                    return ElevatedButton(
                      onPressed: isTitleEmpty
                          ? null
                          : () {
                              final todoCreateState = context
                                  .read<TodoCreateBloc>()
                                  .state;
                              final newTodo = Todo(
                                id: null,
                                title: todoCreateState.title,
                              );

                              context.read<TodoListBloc>().add(
                                TodoListTodoCreated(todo: newTodo),
                              );
                              Navigator.of(context).pop();
                            },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xff000000),
                        foregroundColor: Color(0xffffffff),
                      ),
                      child: Text("추가"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
