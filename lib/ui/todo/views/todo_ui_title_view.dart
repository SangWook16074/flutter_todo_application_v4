import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_list_bloc.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_list_state.dart';

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
        BlocSelector<TodoListBloc, TodoListState, int>(
          selector: (state) {
            return state.todos.where((it) => !it.isDone).length;
          },
          builder: (context, state) {
            return Text(
              "$state 남음",
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
