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
                    itemCount: state.filteredTodos.length,
                    itemBuilder: (context, index) {
                      final todo = state.filteredTodos[index];
                      return TodoListTile(
                        leading: Checkbox(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.3,
                              color: Color(0xfff0f0f0),
                            ),
                            borderRadius: BorderRadiusGeometry.circular(4.0),
                          ),

                          checkColor: Color(0xffffffff),
                          activeColor: Color(0xff000000),
                          value: todo.isDone,
                          onChanged: (value) {
                            final newTodo = todo.copyWith(isDone: value);
                            context.read<TodoListBloc>().add(
                              TodoListTodoCompletionToggled(
                                todo: newTodo,
                                isDone: value!,
                              ),
                            );
                          },
                        ),
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration: todo.isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        subTitle: Text(
                          todo.dateLabel,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffafafaf),
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
