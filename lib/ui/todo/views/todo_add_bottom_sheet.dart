import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_application/ui/todo/viewModels/todo_add_view_model.dart';
import 'package:flutter_todo_application/ui/todo/viewModels/todo_list_view_model.dart';
import 'package:flutter_todo_application/ui/todo/widgets/todo_text_field.dart';

class TodoAddBottomSheet extends ConsumerWidget {
  const TodoAddBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoViewModel = ref.read(todoListViewModelProvider.notifier);
    final todoAddViewModel = ref.read(todoAddViewModelProvider.notifier);
    final todoAddViewState = ref.watch(todoAddViewModelProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "새로운 할 일 추가",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(Icons.close, size: 20, color: Color(0xffafafaf)),
              ),
            ],
          ),
        ),
        TodoTextField(onChanged: todoAddViewModel.onChange),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    foregroundColor: Color(0xff000000),
                  ),
                  child: Text("취소"),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => todoAddViewState.isTitleEmpty
                      ? null
                      : {
                          todoViewModel.saveTodo(todoAddViewState.title),
                          Navigator.of(context).pop(),
                        },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Color(0xff000000),
                    foregroundColor: Color(0xffffffff),
                  ),
                  child: Text("추가"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
