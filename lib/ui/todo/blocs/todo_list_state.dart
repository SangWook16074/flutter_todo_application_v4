import 'package:equatable/equatable.dart';
import 'package:flutter_todo_application/data/models/todo.dart';

enum TodoListStatus { initial, loading, success, failure }

class TodoListState extends Equatable {
  final TodoListStatus status;
  final List<Todo> todos;

  const TodoListState({
    this.todos = const [],
    this.status = TodoListStatus.initial,
  });

  TodoListState copyWith({TodoListStatus? status, List<Todo>? todos}) {
    return TodoListState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object?> get props => [status, todos];
}
