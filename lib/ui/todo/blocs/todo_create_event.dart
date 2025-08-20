import 'package:equatable/equatable.dart';

sealed class TodoCreateEvent extends Equatable {
  const TodoCreateEvent();

  @override
  List<Object?> get props => [];
}

final class TodoCreateTodoTitleChanged extends TodoCreateEvent {
  final String title;

  const TodoCreateTodoTitleChanged({required this.title});

  @override
  List<Object?> get props => [title];
}
