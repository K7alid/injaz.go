import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final AlignmentDirectional alignment;
  final bool isBold;

  const CustomText({
    required this.text,
    this.color = Colors.black,
    this.size = 16,
    this.alignment = AlignmentDirectional.topStart,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: isBold ? FontWeight.bold : null,
        ),
      ),
    );
  }
}
