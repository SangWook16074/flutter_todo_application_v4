import 'package:equatable/equatable.dart';
import 'package:flutter_todo_application/data/models/todo.dart';

class TodoListViewState extends Equatable {
  final List<Todo> todos;

  const TodoListViewState({required this.todos});

  TodoListViewState copyWith({List<Todo>? todos}) {
    return TodoListViewState(todos: todos ?? this.todos);
  }

  @override
  List<Object?> get props => [todos];
}
