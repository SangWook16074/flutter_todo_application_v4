import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_application/core/utils/image_icon_path.dart';
import 'package:flutter_todo_application/core/widgets/image_icon_widget.dart';
import 'package:flutter_todo_application/ui/todo/views/empty_view.dart';
import 'package:flutter_todo_application/ui/todo/views/todo_edit_sheet.dart';
import 'package:flutter_todo_application/ui/todo/widgets/todo_list_tile.dart';

import '../blocs/todo_list.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListBloc, TodoListState>(
      builder: (context, state) {
        return switch (state.status) {
          TodoListStatus.success =>
            state.todos.isEmpty
                ? EmptyView()
                : ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      final todo = state.todos[index];
                      return TodoListTile(
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),

                        trailing: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return SafeArea(
                                  child: TodoEditSheet(todo: todo),
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: ImageIconWidget(
                              width: 20,
                              path: ImageIconPath.more,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

          TodoListStatus.failure => Center(child: Text("에러가 발생했습니다!")),

          _ => Center(child: CircularProgressIndicator.adaptive()),
        };
      },
    );
  }
}
