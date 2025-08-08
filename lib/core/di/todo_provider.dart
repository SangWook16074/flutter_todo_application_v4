import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_application/data/datasources/local_todo_api.dart';
import 'package:flutter_todo_application/data/repositories/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'todo_provider.g.dart';

@riverpod
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  return await SharedPreferences.getInstance();
}

@riverpod
Future<LocalTodoApi> localTodoApi(Ref ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return LocalTodoApi(plugin: prefs);
}

@riverpod
Future<TodoRepository> todoRepository(Ref ref) async {
  final api = await ref.watch(localTodoApiProvider.future);
  return TodoRepository(todoApi: api);
}
