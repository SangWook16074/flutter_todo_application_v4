import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_application/core/components/sheet_close_button.dart';

void main() {
  late Widget widget;
  final arr = [];

  group(SheetCloseButton, () {
    setUp(() {
      widget = MaterialApp(
        home: Scaffold(
          body: SheetCloseButton(
            onTap: () {
              arr.add(0);
            },
          ),
        ),
      );
    });

    tearDown(() {
      arr.clear();
    });

    testWidgets('should render with Icons.close correctly', (tester) async {
      await tester.pumpWidget(widget);

      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('should call button callback when button tap', (tester) async {
      await tester.pumpWidget(widget);
      await tester.tap(find.byType(SheetCloseButton));

      expect(arr.isNotEmpty, true);
      expect(arr.first, 0);
      // await tester.pumpAndSettle();
    });

    testWidgets(
      'verify SheetCloseButton Icon color Color(0xff000000), size = 20',
      (tester) async {
        await tester.pumpWidget(widget);
        final iconFinder = find.byIcon(Icons.close);
        final icon = tester.widget<Icon>(iconFinder);

        expect(icon.color, Color(0xff000000));
        expect(icon.size, 20);
      },
    );
  });
}
