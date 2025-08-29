import 'package:flutter_todo_application/data/models/todo.dart';

abstract class RemoteTodoApi {
  Future<List<Todo>> getTodos();

  Future<Todo> createTodo(Todo todo);

  Future<void> deleteTodo(int id);
}
