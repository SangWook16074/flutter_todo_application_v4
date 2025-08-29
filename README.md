# A&I 3기 Flutter과정 실전 투두 앱 V3

이 버전에서는 REST 통신 예시를 볼 수 있습니다.

![07필터기능 개발](https://github.com/user-attachments/assets/b1d944be-76d3-4d7b-969c-06cb471b2308)

## Getting Started

```
git clone https://github.com/SangWook16074/flutter_todo_application_v2.git
flutter clean
flutter pub get
flutter run
```

## 엔드포인트 설명

flutter에서는 http 패키지를 통해서 REST Api를 연동할 수 있습니다.

아래는 엔드포인트 소스 코드입니다.

```dart
import 'dart:convert';

import 'package:flutter_todo_application/data/datasources/remotes/remote_todo_api.dart';
import 'package:flutter_todo_application/data/models/todo.dart';
import 'package:http/http.dart';

class RemoteTodoApiImpl extends RemoteTodoApi {
  final Client _apiClient;

  RemoteTodoApiImpl({required Client apiClient}) : _apiClient = apiClient;

  @override
  Future<List<Todo>> getTodos() {
    return _apiClient
        .get(
          Uri.parse(
            "YOUR_SERVER_URL/api/todo",
          ),
        )
        .then((response) {
          if (response.statusCode == 200) {
            return List<Map<String, dynamic>>.from(
              jsonDecode(utf8.decode(response.bodyBytes)),
            ).map((json) => Todo.fromJson(json)).toList();
          } else {
            return [];
          }
        });
  }

  @override
  Future<Todo> createTodo(Todo todo) {
    return _apiClient
        .post(
          Uri.parse(
            "http://ec2-54-180-99-56.ap-northeast-2.compute.amazonaws.com:8080/api/todo",
          ),
          body: jsonEncode(todo.toJson()),
          headers: {"Content-Type": "application/json"},
        )
        .then((response) {
          if (response.statusCode == 201) {
            return Todo.fromJson(
              Map<String, dynamic>.from(
                jsonDecode(utf8.decode(response.bodyBytes)),
              ),
            );
          } else {
            throw Exception("에러가 발생했습니다");
          }
        });
  }

  @override
  Future<void> deleteTodo(int id) async {
    await _apiClient.delete(
      Uri.parse(
        "http://ec2-54-180-99-56.ap-northeast-2.compute.amazonaws.com:8080/api/todo/$id",
      ),
    );
  }
}
```

Dio 패키지를 이용하면 REST 뿐만 아니라 다양한 작업을 수행할 수 있습니다.

예를 들어, interceptor를 이용해서 예외처리 혹은 토큰 갱신 등의 작업을 원할하게 할 수 있습니다.
아래는 로깅 작업을 수행하는 interceptor 예 입니다.


```dart
import 'package:dio/dio.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    super.onError(err, handler);
  }
}
```

이는 통신중 발생하는 상황에 대해 로깅을 수행할 수 있습니다. dio에서 해당 interceptor를 cascade 연산자를 통해서 쉽게 붙일 수 있습니다.

```dart
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
              "YOUR_SERVER_URL",
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
```
