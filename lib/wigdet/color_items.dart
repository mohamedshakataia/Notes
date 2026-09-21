import 'package:flutter/material.dart';

class ColorItems extends StatelessWidget {
  const ColorItems({super.key, required this.isactive, required this.color});
  final bool isactive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isactive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: CircleAvatar(radius: 26, backgroundColor: color),
          )
        : CircleAvatar(radius: 30, backgroundColor: color);
  }
}
