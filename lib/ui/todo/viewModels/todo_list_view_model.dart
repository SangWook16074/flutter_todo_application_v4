import 'dart:developer';

import 'package:flutter_todo_application/core/di/todo_provider.dart';
import 'package:flutter_todo_application/data/enums/todo_filter.dart';
import 'package:flutter_todo_application/data/models/todo.dart';
import 'package:flutter_todo_application/ui/todo/viewModels/todo_list_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo_list_view_model.g.dart';

@riverpod
class TodoListViewModel extends _$TodoListViewModel {
  @override
  TodoListViewState build() {
    _init();
    return TodoListViewState(todos: [], status: Status.loading);
  }

  void _init() async {
    try {
      final repository = await ref.read(todoRepositoryProvider.future);
      state = TodoListViewState(
        todos: await repository.getTodos(),
        status: Status.done,
      );
    } catch (e) {
      log(e.toString()); // TOD
      state = TodoListViewState(todos: [], status: Status.error);
    }
  }

  void saveTodo(String title) async {
    final newTodo = Todo(
      id: Uuid().v4(),
      title: title,
      createAt: DateTime.now(),
      isDone: false,
    );

    final repository = await ref.read(todoRepositoryProvider.future);
    repository.saveTodo(newTodo);
    final prevState = state;
    final prevTodos = prevState.todos;
    final newState = prevState.copyWith(todos: [...prevTodos, newTodo]);
    state = newState;
  }

  void updateTodo(Todo todo) async {
    final prevState = state;
    final prevTodos = prevState.todos;
    final newTodos = prevTodos.map((it) {
      if (it.id == todo.id) {
        return todo;
      } else {
        return it;
      }
    }).toList();
    final newState = prevState.copyWith(todos: newTodos);
    final repository = await ref.read(todoRepositoryProvider.future);
    repository.updateTodo(todo);
    state = newState;
  }

  void deleteTodo(String id) async {
    final prevState = state;
    final prevTodos = prevState.todos;
    prevTodos.removeWhere((it) => it.id == id);
    final newTodos = prevTodos;
    final newState = prevState.copyWith(todos: newTodos);
    final repository = await ref.read(todoRepositoryProvider.future);
    repository.deleteTodo(id);
    state = newState;
  }

  void changeTodoFilter(TodoFilter filter) {
    state = state.copyWith(filter: filter);
  }
}
