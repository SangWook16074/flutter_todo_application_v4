import 'dart:developer';

import 'package:flutter_todo_application/core/di/todo_provider.dart';
import 'package:flutter_todo_application/data/models/todo.dart';
import 'package:flutter_todo_application/ui/todo/viewModels/todo_list_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo_list_view_model.g.dart';

@riverpod
class TodoListViewModel extends _$TodoListViewModel {
  @override
  Future<TodoListViewState> build() async {
    try {
      final repository = await ref.read(todoRepositoryProvider.future);
      return TodoListViewState(todos: await repository.getTodos());
    } catch (e) {
      log(e.toString()); // TOD
      return TodoListViewState(todos: []);
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
    final prevState = state.requireValue;
    final prevTodos = prevState.todos;
    final newState = prevState.copyWith(todos: [...prevTodos, newTodo]);
    state = AsyncData(newState);
  }

  void updateTodo(Todo todo) async {
    final prevState = state.requireValue;
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
    state = AsyncData(newState);
  }

  void deleteTodo(String id) async {
    final prevState = state.requireValue;
    final prevTodos = prevState.todos;
    prevTodos.removeWhere((it) => it.id == id);
    final newTodos = prevTodos;
    final newState = prevState.copyWith(todos: newTodos);
    final repository = await ref.read(todoRepositoryProvider.future);
    repository.deleteTodo(id);
    state = AsyncData(newState);
  }
}
