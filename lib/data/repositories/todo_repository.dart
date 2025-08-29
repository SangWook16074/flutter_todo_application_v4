import 'package:flutter_todo_application/data/datasources/local/todo_api.dart';
import 'package:flutter_todo_application/data/datasources/remote/remote_todo_api.dart';
import 'package:flutter_todo_application/data/models/todo.dart';

class TodoRepository {
  final RemoteTodoApi _todoApi;

  const TodoRepository({required RemoteTodoApi todoApi}) : _todoApi = todoApi;

  Future<List<Todo>> getTodos() => _todoApi.getTodos();

  Future<Todo> createTodo(Todo todo) => _todoApi.createTodo(todo);

  Future<void> deleteTodo(int id) => _todoApi.deleteTodo(id);
}
