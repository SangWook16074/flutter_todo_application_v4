import 'package:equatable/equatable.dart';

class TodoAddViewState extends Equatable {
  final String title;

  const TodoAddViewState({this.title = ""});

  bool get isTitleEmpty {
    return title.trim().isEmpty;
  }

  TodoAddViewState copyWith({String? title}) {
    return TodoAddViewState(title: title ?? this.title);
  }

  @override
  List<Object?> get props => [title];
}
