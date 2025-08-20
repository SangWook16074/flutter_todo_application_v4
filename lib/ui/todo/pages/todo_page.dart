import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_application/data/repositories/todo_repository.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_list_bloc.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_list_event.dart';
import 'package:flutter_todo_application/ui/todo/views/todo_ui.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TodoListBloc(todoRepository: context.read<TodoRepository>())
            ..add(TodoListSubscriptionRequest()),
      child: Navigator(
        key: GlobalKey<NavigatorState>(),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => TodoUI());
        },
      ),
    );
  }
}
