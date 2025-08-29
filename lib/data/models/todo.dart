import 'package:equatable/equatable.dart';
import 'package:flutter_todo_application/core/utils/json_map.dart';

class Todo extends Equatable {
  final int? id;
  final String title;

  const Todo({required this.id, required this.title});

  factory Todo.fromJson(JsonMap json) {
    return Todo(id: json['id'], title: json['title']);
  }

  JsonMap toJson() => {'id': id, 'title': title};

  Todo copyWith({String? title}) {
    return Todo(id: id, title: title ?? this.title);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, title];
}
