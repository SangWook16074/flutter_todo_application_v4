import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_create_event.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_create_state.dart';

class TodoCreateBloc extends Bloc<TodoCreateEvent, TodoCreateState> {
  TodoCreateBloc() : super(TodoCreateState()) {
    on<TodoCreateTodoTitleChanged>(_onTodoTitleChanged);
  }

  FutureOr<void> _onTodoTitleChanged(
    TodoCreateTodoTitleChanged event,
    Emitter<TodoCreateState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }
}
