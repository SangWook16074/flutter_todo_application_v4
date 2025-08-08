import 'package:flutter_todo_application/ui/todo/viewModels/todo_add_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_add_view_model.g.dart';

@riverpod
class TodoAddViewModel extends _$TodoAddViewModel {
  @override
  TodoAddViewState build() {
    return TodoAddViewState();
  }

  void onChange(String title) {
    state = state.copyWith(title: title);
  }
}
