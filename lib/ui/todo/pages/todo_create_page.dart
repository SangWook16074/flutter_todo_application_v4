import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_create_bloc.dart';
import 'package:flutter_todo_application/ui/todo/views/todo_add_bottom_sheet.dart';

class TodoCreatePage extends StatelessWidget {
  const TodoCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCreateBloc(),
      child: TodoAddBottomSheet(),
    );
  }
}
