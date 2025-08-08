import 'package:equatable/equatable.dart';
import 'package:flutter_todo_application/data/models/todo.dart';

class TodoUpdateViewState extends Equatable {
  final Todo todo;
  const TodoUpdateViewState({required this.todo});

  TodoUpdateViewState copyWith({String? title}) {
    return TodoUpdateViewState(
      todo: title == null ? todo : todo.copyWith(title: title),
    );
  }

  @override
  List<Object?> get props => [todo];
}
