import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_application/data/models/todo.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_update_event.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_update_state.dart';

class TodoUpdateBloc extends Bloc<TodoUpdateEvent, TodoUpdateState> {
  TodoUpdateBloc({required Todo todo}) : super(TodoUpdateState(todo: todo)) {
    on<TodoUpdateTodoTitleUpdate>(_onTodoTitleUpdate);
  }

  FutureOr<void> _onTodoTitleUpdate(
    TodoUpdateTodoTitleUpdate event,
    Emitter<TodoUpdateState> emit,
  ) {
    final todo = state.todo.copyWith(title: event.title);
    emit(state.copyWith(todo: todo));
  }
}
