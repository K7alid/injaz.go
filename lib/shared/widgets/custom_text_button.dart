import 'package:flutter/material.dart';
import 'package:injaz_go/shared/widgets/custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;

  const CustomTextButton({
    super.key,
    this.color = Colors.blue,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: CustomText(
        text: text.toUpperCase(),
        color: color,
      ),
    );
  }
}
