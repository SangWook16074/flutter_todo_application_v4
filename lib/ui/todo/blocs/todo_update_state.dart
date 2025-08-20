import 'package:equatable/equatable.dart';
import 'package:flutter_todo_application/data/models/todo.dart';

class TodoUpdateState extends Equatable {
  final Todo todo;

  const TodoUpdateState({required this.todo});

  @override
  List<Object?> get props => [todo];

  TodoUpdateState copyWith({Todo? todo}) {
    return TodoUpdateState(todo: todo ?? this.todo);
  }
}
