import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final IconData? prefix;
  final IconData? suffix;
  final double radius;
  final TextInputType textInputType;
  final TextEditingController controller;
  final Function? onSubmitted;
  final Function? onChange;
  final Function? onTap;
  final Function validate;
  final Function? onSuffixPressed;
  final bool isPassword;

  CustomTextFormField({
    required this.label,
    this.radius = 0.0,
    required this.textInputType,
    required this.controller,
    required this.validate,
    this.isPassword = false,
    this.onTap,
    this.onChange,
    this.onSubmitted,
    this.prefix,
    this.suffix,
    this.onSuffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      validator: (value) {
        validate(value);
        return null;
      },
      controller: controller,
      onFieldSubmitted: (value) {
        onSubmitted!(value);
      },
      onChanged: (value) {
        onChange!(value);
      },
      onTap: () {
        onTap!();
      },
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
