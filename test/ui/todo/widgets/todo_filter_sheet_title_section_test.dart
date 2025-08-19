import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_application/core/components/sheet_close_button.dart';
import 'package:flutter_todo_application/ui/todo/widgets/todo_filter_sheet_title_section.dart';

void main() {
  group(TodoFilterSheetTitleSection, () {
    late Widget widget;

    setUp(() {
      widget = MaterialApp(home: Scaffold(body: TodoFilterSheetTitleSection()));
    });

    testWidgets('should render title section label "필터 및 옵션"', (tester) async {
      await tester.pumpWidget(widget);

      expect(find.text('필터 및 옵션'), findsOneWidget);
    });

    testWidgets(
      'verify TextStyle with fontSize = 20, fontWeight = FontWeight.w600, color = Color(0xff000000',
      (tester) async {
        await tester.pumpWidget(widget);
        final textFinder = find.text('필터 및 옵션');
        final textWidget = tester.widget<Text>(textFinder);
        expect(textWidget.style?.fontSize, 20);
        expect(textWidget.style?.fontWeight, FontWeight.w600);
        expect(textWidget.style?.color, Color(0xff000000));
      },
    );

    testWidgets('should render SheetCloseButton correctly', (tester) async {
      await tester.pumpWidget(widget);
      expect(find.byType(SheetCloseButton), findsOneWidget);
    });
  });
}
