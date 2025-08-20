import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_application/data/models/todo.dart';
import 'package:flutter_todo_application/data/repositories/todo_repository.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_list_event.dart';
import 'package:flutter_todo_application/ui/todo/blocs/todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final TodoRepository _todoRepository;

  TodoListBloc({required TodoRepository todoRepository})
    : _todoRepository = todoRepository,
      super(TodoListState()) {
    on<TodoListSubscriptionRequest>(_onSubscriptionRequest);
    on<TodoListTodoCreated>(_onTodoCreated);
    on<TodoListTodoCompletionToggled>(_onTodoCompletionToggled);
    on<TodoListFilterChanged>(_onFilterChanged);
    on<TodoListTodoDeleted>(_onTodoDeleted);
    on<TodoListTodoEdited>(_onTodoEdited);
  }

  FutureOr<void> _onSubscriptionRequest(
    TodoListSubscriptionRequest event,
    Emitter<TodoListState> emit,
  ) async {
    emit(state.copyWith(status: TodoListStatus.loading));

    await emit.forEach<List<Todo>>(
      _todoRepository.getTodos(),
      onData: (todos) =>
          state.copyWith(status: TodoListStatus.success, todos: todos),
      onError: (_, _) => state.copyWith(status: TodoListStatus.failure),
    );
  }

  FutureOr<void> _onTodoCreated(
    TodoListTodoCreated event,
    Emitter<TodoListState> emit,
  ) async {
    await _todoRepository.saveTodo(event.todo);
  }

  FutureOr<void> _onTodoCompletionToggled(
    TodoListTodoCompletionToggled event,
    Emitter<TodoListState> emit,
  ) async {
    final newTodo = event.todo.copyWith(isDone: event.isDone);
    await _todoRepository.updateTodo(newTodo);
  }

  FutureOr<void> _onFilterChanged(
    TodoListFilterChanged event,
    Emitter<TodoListState> emit,
  ) async {
    emit(state.copyWith(filter: event.filter));
  }

  FutureOr<void> _onTodoDeleted(
    TodoListTodoDeleted event,
    Emitter<TodoListState> emit,
  ) async {
    await _todoRepository.deleteTodo(event.todo.id);
  }

  FutureOr<void> _onTodoEdited(
    TodoListTodoEdited event,
    Emitter<TodoListState> emit,
  ) async {
    await _todoRepository.updateTodo(event.todo);
  }
}
