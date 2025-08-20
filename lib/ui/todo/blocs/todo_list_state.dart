import 'package:equatable/equatable.dart';
import 'package:flutter_todo_application/data/enums/todo_filter.dart';
import 'package:flutter_todo_application/data/models/todo.dart';

enum TodoListStatus { initial, loading, success, failure }

class TodoListState extends Equatable {
  final TodoListStatus status;
  final List<Todo> todos;
  final TodoFilter filter;

  const TodoListState({
    this.todos = const [],
    this.status = TodoListStatus.initial,
    this.filter = TodoFilter.all,
  });

  List<Todo> get filteredTodos => filter.apply(todos);

  TodoListState copyWith({
    TodoListStatus? status,
    List<Todo>? todos,
    TodoFilter? filter,
  }) {
    return TodoListState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object?> get props => [status, todos, filter];
}
