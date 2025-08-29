import 'package:dio/dio.dart';
import 'package:flutter_todo_application/core/utils/custom_interceptor.dart';
import 'package:flutter_todo_application/data/datasources/remote/remote_todo_api.dart';
import 'package:flutter_todo_application/data/models/todo.dart';

class RemoteTodoApiImpl extends RemoteTodoApi {
  final Dio _client;
  RemoteTodoApiImpl({required Dio client})
    : _client = client
        ..options = BaseOptions(
          baseUrl:
              "http://ec2-54-180-99-56.ap-northeast-2.compute.amazonaws.com:8080",
        )
        ..interceptors.add(CustomInterceptors());

  /// GET, POST, DELETE
  @override
  Future<List<Todo>> getTodos() {
    return _client.get("/api/todo").then((response) {
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(
          response.data,
        ).map((json) => Todo.fromJson(json)).toList();
      } else {
        throw Exception("연결 실패!");
      }
    });
  }

  @override
  Future<Todo> createTodo(Todo todo) {
    return _client.post("/api/todo", data: todo.toJson()).then((response) {
      if (response.statusCode == 201) {
        return Todo.fromJson(response.data);
      } else {
        throw Exception("연결 실패!");
      }
    });
  }

  @override
  Future<void> deleteTodo(int id) async {
    await _client.delete("/api/todo/$id").then((response) {
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception("연결 실패!");
      }
    });
  }
}
