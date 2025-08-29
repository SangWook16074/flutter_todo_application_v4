import 'dart:convert';

import 'package:flutter_todo_application/data/datasources/local/todo_api.dart';
import 'package:flutter_todo_application/data/models/todo.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalTodoApi extends TodoApi {
  LocalTodoApi({required SharedPreferences plugin}) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;

  late final _todoStreamController = BehaviorSubject<List<Todo>>.seeded(
    const [],
  );

  static const _key = "todos";

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  _init() {
    final todosJson = _getValue(_key);
    if (todosJson != null) {
      final todos = List<Map<String, dynamic>>.from(
        jsonDecode(todosJson) as List,
      ).map((json) => Todo.fromJson(Map<String, dynamic>.from(json))).toList();
      return _todoStreamController.add(todos);
    } else {
      return _todoStreamController.add([]);
    }
  }

  @override
  Stream<List<Todo>> getTodos() => _todoStreamController.asBroadcastStream();

  @override
  Future<void> saveTodo(Todo todo) async {
    var todos = [..._todoStreamController.value, todo];

    _todoStreamController.add(todos);

    return _setValue(
      _key,
      jsonEncode([...todos, todo].map((todo) => todo.toJson()).toList()),
    );
  }

  @override
  Future<void> deleteTodo(String id) async {
    final todos = [..._todoStreamController.value];
    todos.removeWhere((todo) => todo.id == id);
    _todoStreamController.add(todos);
    return _setValue(
      _key,
      jsonEncode(todos.map((todo) => todo.toJson()).toList()),
    );
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final todos = [..._todoStreamController.value];
    final index = todos.indexWhere((it) => it.id == todo.id);
    if (index != -1) {
      todos[index] = todo;
      _todoStreamController.add(todos);
      await _setValue(
        _key,
        jsonEncode(todos.map((todo) => todo.toJson()).toList()),
      );
    }
  }

  @override
  Future<void> close() {
    return _todoStreamController.close();
  }
}
