import 'package:flutter/material.dart';

class SheetCloseButton extends StatelessWidget {
  final void Function()? onTap;
  const SheetCloseButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(Icons.close, color: Color(0xff000000), size: 20),
    );
  }
}
