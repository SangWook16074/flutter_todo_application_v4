import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_application/core/utils/observer.dart';
import 'package:flutter_todo_application/ui/todo/views/todo_ui.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(observers: [MyObserver()], child: MyApp()));
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
      home: TodoUI(),
    );
  }
}
