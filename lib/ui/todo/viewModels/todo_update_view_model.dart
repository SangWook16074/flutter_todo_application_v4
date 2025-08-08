import 'package:flutter_todo_application/data/models/todo.dart';
import 'package:flutter_todo_application/ui/todo/viewModels/todo_update_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_update_view_model.g.dart';

@riverpod
class TodoUpdateViewModel extends _$TodoUpdateViewModel {
  @override
  TodoUpdateViewState build(Todo todo) {
    return TodoUpdateViewState(todo: todo);
  }

  void onChanged(String value) {
    state = state.copyWith(title: value);
  }
}
