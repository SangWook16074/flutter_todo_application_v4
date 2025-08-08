import 'package:flutter/material.dart';

class ImageIconWidget extends StatelessWidget {
  final String path;
  final double width;
  const ImageIconWidget({super.key, required this.path, this.width = 100});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: width,
      child: Image.asset(path, fit: BoxFit.contain),
    );
  }
}
