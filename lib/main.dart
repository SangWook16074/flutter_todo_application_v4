import 'dart:developer';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_application/core/utils/todo_bloc_observer.dart';
import 'package:flutter_todo_application/data/datasources/local/local_todo_api.dart';
import 'package:flutter_todo_application/data/datasources/remote/remote_todo_api_impl.dart';
import 'package:flutter_todo_application/data/repositories/todo_repository.dart';
import 'package:flutter_todo_application/ui/todo/pages/todo_page.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final todosApi = LocalTodoApi(plugin: await SharedPreferences.getInstance());

  final remoteTodoApi = RemoteTodoApiImpl(client: Dio());

  Bloc.observer = TodoBlocObserver();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    log(error.toString(), stackTrace: stack);
    return true;
  };

  runApp(
    RepositoryProvider(
      create: (context) => TodoRepository(todoApi: remoteTodoApi),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffffffff),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xffffffff)),
        fontFamily: "Pretendard",
        useMaterial3: false,
      ),
      home: TodoPage(),
    );
  }
}
