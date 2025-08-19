import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_application/data/enums/todo_filter.dart';
import 'package:flutter_todo_application/ui/todo/viewModels/todo_list_view_model.dart';

class TodoFilterSelectSection extends ConsumerWidget {
  const TodoFilterSelectSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListVM = ref.read(todoListViewModelProvider.notifier);
    final todoListViewState = ref.watch(todoListViewModelProvider);
    return Column(
      children: TodoFilter.values.map((filter) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: GestureDetector(
            onTap: () {
              todoListVM.changeTodoFilter(filter);
              Navigator.of(context).pop();
            },
            child: Container(
              alignment: Alignment.centerLeft,

              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: todoListViewState.filter == filter
                    ? Color(0xff000000)
                    : Color(0xffffffff),
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(width: 0.5, color: Color(0xff000000)),
              ),

              child: Text(
                filter.label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: todoListViewState.filter == filter
                      ? Color(0xffffffff)
                      : Color(0xff000000),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
