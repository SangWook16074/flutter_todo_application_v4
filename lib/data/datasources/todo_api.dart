import 'package:flutter_todo_application/data/models/todo.dart';

abstract class TodoApi {
  Future<List<Todo>> getTodos();

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(String id);

  Future<void> updateTodo(Todo todo);
}
