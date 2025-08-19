import 'package:equatable/equatable.dart';
import 'package:flutter_todo_application/data/enums/todo_filter.dart';
import 'package:flutter_todo_application/data/models/todo.dart';

enum Status { loading, error, done }

class TodoListViewState extends Equatable {
  final List<Todo> todos;
  final Status status;
  final TodoFilter filter;
  const TodoListViewState({
    required this.todos,
    required this.status,
    this.filter = TodoFilter.all,
  });

  int get restTodoCount {
    return todos.where((todo) => !todo.isDone).length;
  }

  List<Todo> get filteredTodos {
    return filter.apply(todos);
  }

  TodoListViewState copyWith({
    List<Todo>? todos,
    Status? status,
    TodoFilter? filter,
  }) {
    return TodoListViewState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object?> get props => [todos];
}
