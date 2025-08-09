import 'package:equatable/equatable.dart';
import 'package:flutter_todo_application/data/models/todo.dart';

enum Status { loading, error, done }

class TodoListViewState extends Equatable {
  final List<Todo> todos;
  final Status status;
  const TodoListViewState({required this.todos, required this.status});

  int get restTodoCount {
    return todos.where((todo) => !todo.isDone).length;
  }

  TodoListViewState copyWith({List<Todo>? todos, Status? status}) {
    return TodoListViewState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [todos];
}
