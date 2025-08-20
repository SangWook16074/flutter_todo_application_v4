import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_application/data/enums/todo_filter.dart';

import '../blocs/todo_list.dart';

class TodoFilterSelectSection extends StatelessWidget {
  const TodoFilterSelectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: TodoFilter.values.map((filter) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: GestureDetector(
            onTap: () {
              context.read<TodoListBloc>().add(
                TodoListFilterChanged(filter: filter),
              );
              Navigator.of(context).pop();
            },
            child: BlocBuilder<TodoListBloc, TodoListState>(
              builder: (context, state) {
                return Container(
                  alignment: Alignment.centerLeft,

                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: state.filter == filter
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
                      color: state.filter == filter
                          ? Color(0xffffffff)
                          : Color(0xff000000),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}
