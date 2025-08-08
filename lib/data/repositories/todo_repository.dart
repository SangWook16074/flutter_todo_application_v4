import 'package:flutter_todo_application/data/datasources/todo_api.dart';
import 'package:flutter_todo_application/data/models/todo.dart';

class TodoRepository {
  final TodoApi _todoApi;

  const TodoRepository({required TodoApi todoApi}) : _todoApi = todoApi;

  Future<List<Todo>> getTodos() => _todoApi.getTodos();

  Future<void> saveTodo(Todo todo) => _todoApi.saveTodo(todo);

  Future<void> deleteTodo(String id) => _todoApi.deleteTodo(id);

  Future<void> updateTodo(Todo todo) => _todoApi.updateTodo(todo);
}
