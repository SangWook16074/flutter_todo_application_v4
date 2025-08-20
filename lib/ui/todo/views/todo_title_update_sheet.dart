import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_list_bloc.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_list_event.dart';
import 'package:flutter_todo_application/ui/todo/widgets/todo_text_field.dart';

import '../blocs/todo_update.dart';

class TodoTitleUpdateSheet extends StatelessWidget {
  const TodoTitleUpdateSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "수정하기",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.close, size: 20, color: Color(0xffafafaf)),
                ),
              ],
            ),
          ),
          BlocBuilder<TodoUpdateBloc, TodoUpdateState>(
            builder: (context, state) {
              return TodoTextField(
                hintLabel: state.todo.title,
                onChanged: (title) {
                  context.read<TodoUpdateBloc>().add(
                    TodoUpdateTodoTitleUpdate(title: title),
                  );
                },
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
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Color(0xff000000),
                    ),
                    child: Text("취소"),
                  ),
                ),
                Expanded(
                  child: BlocSelector<TodoUpdateBloc, TodoUpdateState, bool>(
                    selector: (state) {
                      return state.todo.title.isEmpty;
                    },
                    builder: (context, isTitleEmpty) {
                      return ElevatedButton(
                        onPressed: isTitleEmpty
                            ? null
                            : () {
                                final newTodo = context
                                    .read<TodoUpdateBloc>()
                                    .state
                                    .todo;
                                context.read<TodoListBloc>().add(
                                  TodoListTodoEdited(todo: newTodo),
                                );
                                Navigator.of(
                                  context,
                                ).popUntil((route) => route.isFirst);
                              },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Color(0xff000000),
                          foregroundColor: Color(0xffffffff),
                        ),
                        child: Text("저장"),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
