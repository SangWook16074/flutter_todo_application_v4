import 'package:flutter/material.dart';
import 'package:flutter_todo_application/core/utils/image_icon_path.dart';
import 'package:flutter_todo_application/core/widgets/image_icon_widget.dart';
import 'package:flutter_todo_application/ui/todo/views/todo_add_bottom_sheet.dart';
import 'package:flutter_todo_application/ui/todo/views/todo_list_view.dart';
import 'package:flutter_todo_application/ui/todo/views/todo_ui_title_view.dart';

class TodoUI extends StatelessWidget {
  const TodoUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Color(0xff000000),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ImageIconWidget(width: 10, path: ImageIconPath.checkSquare),
          ),
        ),
        elevation: 0.0,
        centerTitle: false,
        title: TodoUITitleView(),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ImageIconWidget(width: 20, path: ImageIconPath.filter),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(height: 1.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff000000),

        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            useSafeArea: true,
            context: context,
            builder: (context) => SafeArea(
              bottom: true,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: TodoAddBottomSheet(),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: TodoListView(),
    );
  }
}
