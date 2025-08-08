import 'package:equatable/equatable.dart';
import 'package:flutter_todo_application/core/utils/json_map.dart';

class Todo extends Equatable {
  final String id;
  final String title;
  final DateTime createAt;
  final bool isDone;

  const Todo({
    required this.id,
    required this.title,
    required this.createAt,
    required this.isDone,
  });

  String get dateLabel {
    return "${createAt.year}. ${createAt.month}. ${createAt.day}.";
  }

  factory Todo.fromJson(JsonMap json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      createAt: DateTime.parse(json['createAt'] as String),
      isDone: json['isDone'],
    );
  }

  JsonMap toJson() => {
    'id': id,
    'title': title,
    'createAt': createAt.toIso8601String(),
    'isDone': isDone,
  };

  Todo copyWith({String? title, DateTime? createAt, bool? isDone}) {
    return Todo(
      id: id,
      title: title ?? this.title,
      createAt: createAt ?? this.createAt,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, createAt, isDone];
}
