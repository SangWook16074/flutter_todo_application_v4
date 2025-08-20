import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_application/data/models/todo.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_update_bloc.dart';
import 'package:flutter_todo_application/ui/todo/views/todo_title_update_sheet.dart';

class TodoUpdatePage extends StatelessWidget {
  final Todo todo;
  const TodoUpdatePage({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoUpdateBloc(todo: todo),
      child: TodoTitleUpdateSheet(),
    );
  }
}
