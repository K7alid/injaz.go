import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color background;
  final Function onPressed;
  final double width;
  final double radius;
  final bool isUpperCase;

  CustomButton({
    this.width = double.infinity,
    this.background = Colors.blue,
    required this.onPressed,
    required this.text,
    this.isUpperCase = true,
    this.radius = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
