import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_application/core/di/todo_provider.dart';
import 'package:flutter_todo_application/data/enums/todo_filter.dart';
import 'package:flutter_todo_application/data/models/todo.dart';
import 'package:flutter_todo_application/data/repositories/todo_repository.dart';
import 'package:flutter_todo_application/ui/todo/viewModels/todo_list_view_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_riverpod/src/internals.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

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

  group(TodoListViewModel, () {
    late MockTodoRepository mockTodoRepository;

    setUp(() {
      mockTodoRepository = MockTodoRepository();
    });

    test('should change filters correctly', () {
      when(() => mockTodoRepository.getTodos()).thenAnswer((_) async => todos);

      final container = ProviderContainer(
        overrides: [
          todoRepositoryProvider.overrideWith((ref) => mockTodoRepository),
        ],
      );
      final vm = container.read(todoListViewModelProvider.notifier);

      vm.changeTodoFilter(TodoFilter.completed);

      final state = container.read(todoListViewModelProvider);
      expect(state.filter, TodoFilter.completed);
    });
  });
}
