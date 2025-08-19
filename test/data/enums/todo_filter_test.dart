import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_application/data/enums/todo_filter.dart';
import 'package:flutter_todo_application/data/models/todo.dart';

void main() {
  group(TodoFilter, () {
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

    test('should returns all todos when all filters apply', () {
      final result = TodoFilter.all.apply(todos);

      expect(result.length, 4);
      expect(result[0].title, 'todo 1');
      expect(result[1].title, 'todo 2');
      expect(result[2].title, 'todo 3');
      expect(result[3].title, 'todo 4');
    });

    test(
      'should returns todos where isDone field is false when inCompleted filters apply',
      () {
        final result = TodoFilter.inCompleted.apply(todos);

        expect(result.length, 3);
      },
    );

    test('should returns todos where isDone field is true when completed', () {
      final result = TodoFilter.completed.apply(todos);

      expect(result.length, 1);
      expect(result[0].title, 'todo 2');
      expect(result[0].isDone, true);
    });
  });
}
