import 'package:equatable/equatable.dart';
import 'package:flutter_todo_application/data/enums/todo_filter.dart';
import 'package:flutter_todo_application/data/models/todo.dart';

sealed class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object?> get props => [];
}

final class TodoListSubscriptionRequest extends TodoListEvent {
  const TodoListSubscriptionRequest();
}

final class TodoListTodoCompletionToggled extends TodoListEvent {
  final Todo todo;
  final bool isDone;

  const TodoListTodoCompletionToggled({
    required this.todo,
    required this.isDone,
  });

  @override
  List<Object?> get props => [todo, isDone];
}

final class TodoListTodoCreated extends TodoListEvent {
  final Todo todo;

  const TodoListTodoCreated({required this.todo});

  @override
  List<Object?> get props => [todo];
}

final class TodoListTodoDeleted extends TodoListEvent {
  final Todo todo;

  const TodoListTodoDeleted({required this.todo});

  @override
  List<Object?> get props => [todo];
}

final class TodoListFilterChanged extends TodoListEvent {
  final TodoFilter filter;

  const TodoListFilterChanged({required this.filter});

  @override
  List<Object?> get props => [filter];
}

final class TodoListTodoEdited extends TodoListEvent {
  final Todo todo;

  const TodoListTodoEdited({required this.todo});

  @override
  List<Object?> get props => [todo];
}
