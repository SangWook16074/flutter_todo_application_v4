import 'package:equatable/equatable.dart';
import 'package:flutter_todo_application/data/models/todo.dart';

sealed class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object?> get props => [];
}

final class TodoListSubscriptionRequest extends TodoListEvent {
  const TodoListSubscriptionRequest();
}

final class TodoListTodoCreated extends TodoListEvent {
  final Todo todo;

  const TodoListTodoCreated({required this.todo});

  @override
  List<Object?> get props => [todo];
}

final class TodoListTodoDeleted extends TodoListEvent {
  final int id;

  const TodoListTodoDeleted({required this.id});

  @override
  List<Object?> get props => [id];
}
