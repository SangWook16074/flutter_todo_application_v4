import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_application/data/enums/todo_filter.dart';
import 'package:flutter_todo_application/ui/todo/widgets/todo_filter_select_section.dart';

void main() {
  group(TodoFilterSelectSection, () {
    late Widget widget;
    setUp(() {
      widget = MaterialApp(home: Scaffold(body: TodoFilterSelectSection()));
    });

    testWidgets('should render todo list all filters', (tester) async {
      await tester.pumpWidget(widget);

      for (var filter in TodoFilter.values) {
        expect(find.text(filter.label), findsOneWidget);
      }
    });
  });
}
