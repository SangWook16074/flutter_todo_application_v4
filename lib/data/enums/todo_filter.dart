import 'package:flutter_todo_application/data/models/todo.dart';

enum TodoFilter {
  all("전체"),
  inCompleted("진행 중"),
  completed("완료");

  final String label;
  const TodoFilter(this.label);

  List<Todo> apply(List<Todo> todo) {
    switch (this) {
      case TodoFilter.all:
        return todo;
      case TodoFilter.inCompleted:
        return todo.where((it) => !it.isDone).toList();
      case TodoFilter.completed:
        return todo.where((it) => it.isDone).toList();
    }
  }
}
