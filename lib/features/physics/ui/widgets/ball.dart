import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  const Ball({super.key, required this.data, required this.color});
  final String data;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: data,
      feedback: CircleAvatar(backgroundColor: color),
      childWhenDragging: CircleAvatar(backgroundColor: color.withAlpha(30)),
      child: CircleAvatar(backgroundColor: color),
    );
  }
}
