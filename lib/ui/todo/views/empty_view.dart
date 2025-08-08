import 'package:flutter/material.dart';
import 'package:flutter_todo_application/core/utils/image_icon_path.dart';
import 'package:flutter_todo_application/core/widgets/image_icon_widget.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffdfdfdf),
            ),
            child: ImageIconWidget(
              width: 40,
              path: ImageIconPath.checkSquareBlack,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "첫 번째 할 일을 추가해보세요",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xff000000),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "오른쪽 하단의 + 버튼을 눌러 할 일을 추가하세요",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }
}
