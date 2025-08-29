import 'package:flutter/material.dart';

class TodoListTile extends StatelessWidget {
  final Widget? title;
  final Widget? subTitle;
  final Widget? leading;
  final Widget? trailing;
  const TodoListTile({
    super.key,
    this.title,
    this.subTitle,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (leading != null) leading!,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) title!,
                  if (subTitle != null) subTitle!,
                ],
              ),
            ],
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
