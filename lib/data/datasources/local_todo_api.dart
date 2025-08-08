import 'dart:convert';

import 'package:flutter_todo_application/data/datasources/todo_api.dart';
import 'package:flutter_todo_application/data/models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalTodoApi extends TodoApi {
  LocalTodoApi({required SharedPreferences plugin}) : _plugin = plugin;

  final SharedPreferences _plugin;

  static const _key = "todos";

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  @override
  Future<List<Todo>> getTodos() async {
    final todosJson = _getValue(_key);
    if (todosJson != null) {
      final todos = List<Map<String, dynamic>>.from(
        jsonDecode(todosJson) as List,
      ).map((json) => Todo.fromJson(Map<String, dynamic>.from(json))).toList();
      return todos;
    } else {
      return [];
    }
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    var todos = await getTodos();

    await _setValue(
      _key,
      jsonEncode([...todos, todo].map((todo) => todo.toJson()).toList()),
    );
  }

  @override
  Future<void> deleteTodo(String id) async {
    final todos = await getTodos();
    todos.removeWhere((todo) => todo.id == id);
    await _setValue(
      _key,
      jsonEncode(todos.map((todo) => todo.toJson()).toList()),
    );
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final todos = await getTodos();
    final index = todos.indexWhere((it) => it.id == todo.id);
    if (index != -1) {
      todos[index] = todo;
      await _setValue(
        _key,
        jsonEncode(todos.map((todo) => todo.toJson()).toList()),
      );
    }
  }
}
