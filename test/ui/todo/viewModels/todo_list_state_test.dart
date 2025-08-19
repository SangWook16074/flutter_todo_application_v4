import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_application/data/enums/todo_filter.dart';
import 'package:flutter_todo_application/data/models/todo.dart';
import 'package:flutter_todo_application/ui/todo/viewModels/todo_list_view_state.dart';

void main() {
  final todos = [
    Todo(
      id: 'uuid1',
      title: 'todo 1',
      createAt: DateTime(2025, 8, 15),
      isDone: false,
    ),
    Todo(
      id: 'uuid2',
      title: 'todo 2',
      createAt: DateTime(2025, 8, 10),
      isDone: true,
    ),
    Todo(
      id: 'uuid3',
      title: 'todo 3',
      createAt: DateTime(2025, 8, 20),
      isDone: false,
    ),
    Todo(
      id: 'uuid4',
      title: 'todo 4',
      createAt: DateTime(2025, 8, 5),
      isDone: false,
    ),
  ];
  late TodoListViewState state;

  group(TodoListViewState, () {
    setUp(() {
      state = TodoListViewState(todos: todos, status: Status.done);
    });

    test('should returns all todos when initial state', () {
      final todos = state.filteredTodos;
      expect(todos.length, 4);
    });

    test('should return todos correctly when filter apply', () {
      final todos = state.filteredTodos;
      expect(todos.length, 4);

      state = state.copyWith(filter: TodoFilter.completed);

      final completedTodos = state.filteredTodos;
      expect(completedTodos.length, 1);

      state = state.copyWith(filter: TodoFilter.inCompleted);
      final incompletedTodos = state.filteredTodos;
      expect(incompletedTodos.length, 3);
    });
  });
}
