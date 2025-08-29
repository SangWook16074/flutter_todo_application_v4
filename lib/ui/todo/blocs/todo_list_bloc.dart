import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
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
    on<TodoListTodoDeleted>(_onTodoDeleted);
  }

  FutureOr<void> _onSubscriptionRequest(
    TodoListSubscriptionRequest event,
    Emitter<TodoListState> emit,
  ) async {
    emit(
      state.copyWith(
        todos: await _todoRepository.getTodos(),
        status: TodoListStatus.success,
      ),
    );
  }

  FutureOr<void> _onTodoCreated(
    TodoListTodoCreated event,
    Emitter<TodoListState> emit,
  ) async {
    final newTodo = event.todo;
    final prevTodos = state.todos;

    emit(state.copyWith(todos: [...prevTodos, newTodo]));
    final result = await _todoRepository.createTodo(newTodo);
    emit(state.copyWith(todos: [...prevTodos, result]));
  }

  FutureOr<void> _onTodoDeleted(
    TodoListTodoDeleted event,
    Emitter<TodoListState> emit,
  ) async {
    final prevTodos = state.todos;
    emit(
      state.copyWith(
        todos: prevTodos.where((todo) => todo.id != event.id).toList(),
      ),
    );
    await _todoRepository.deleteTodo(event.id);
  }
}
