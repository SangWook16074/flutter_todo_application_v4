import 'package:flutter/material.dart';

class TodoListTile extends StatelessWidget {
  final Widget title;
  final Widget subTitle;
  final Widget leading;
  final Widget trailing;
  const TodoListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.leading,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              leading,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [title, subTitle],
              ),
            ],
          ),
          trailing,
        ],
      ),
    );
  }
}
