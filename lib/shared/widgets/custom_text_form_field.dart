import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final IconData? prefix;
  final IconData? suffix;
  final double radius;
  final TextInputType textInputType;
  final TextEditingController controller;
  final Function validate;
  final Function? onSuffixPressed;
  final bool isPassword;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.radius = 0.0,
    required this.textInputType,
    required this.controller,
    required this.validate,
    this.isPassword = false,
    this.prefix,
    this.suffix,
    this.onSuffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isPassword,
      validator: (value) {
        validate(value);
        return null;
      },
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: () {
                  onSuffixPressed!();
                },
              )
            : null,
      ),
    );
  }
}
