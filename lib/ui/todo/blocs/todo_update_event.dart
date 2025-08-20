import 'package:equatable/equatable.dart';

sealed class TodoUpdateEvent extends Equatable {
  const TodoUpdateEvent();

  @override
  List<Object?> get props => [];
}

final class TodoUpdateTodoTitleUpdate extends TodoUpdateEvent {
  final String title;

  const TodoUpdateTodoTitleUpdate({required this.title});

  @override
  List<Object?> get props => [title];
}
