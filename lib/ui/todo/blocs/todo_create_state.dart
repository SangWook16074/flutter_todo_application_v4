import 'package:equatable/equatable.dart';

class TodoCreateState extends Equatable {
  final String title;

  const TodoCreateState({this.title = ""});

  @override
  List<Object?> get props => [title];

  TodoCreateState copyWith({String? title}) {
    return TodoCreateState(title: title ?? this.title);
  }
}
