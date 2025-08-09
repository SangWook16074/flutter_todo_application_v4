import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_application/data/models/todo.dart';
import 'package:flutter_todo_application/ui/todo/viewModels/todo_list_view_model.dart';
import 'package:flutter_todo_application/ui/todo/viewModels/todo_update_view_model.dart';
import 'package:flutter_todo_application/ui/todo/widgets/todo_text_field.dart';

class TodoTitleUpdateSheet extends ConsumerWidget {
  final Todo todo;
  const TodoTitleUpdateSheet({super.key, required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListViewModel = ref.read(todoListViewModelProvider.notifier);
    final state = ref.watch(todoUpdateViewModelProvider(todo));
    final viewModel = ref.read(todoUpdateViewModelProvider(todo).notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "수정하기",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.close, size: 20, color: Color(0xffafafaf)),
                ),
              ],
            ),
          ),
          TodoTextField(
            hintLabel: state.todo.title,
            onChanged: viewModel.onChanged,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Color(0xff000000),
                    ),
                    child: Text("취소"),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final newTodo = state.todo;
                      todoListViewModel.updateTodo(newTodo);
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Color(0xff000000),
                      foregroundColor: Color(0xffffffff),
                    ),
                    child: Text("저장"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
