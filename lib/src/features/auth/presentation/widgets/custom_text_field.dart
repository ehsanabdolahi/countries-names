import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final EdgeInsetsGeometry? contentPadding;
  final InputDecoration? decoration;
  final TextStyle? textStyle;
  final Color? fillColor;
  final bool filled;
  final BorderRadius? borderRadius;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.contentPadding,
    this.decoration,
    this.textStyle,
    this.fillColor,
    this.filled = false,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
      validator: validator,
      decoration: decoration ??
          InputDecoration(
            labelText: labelText,
            hintText: hintText,
            suffixIcon: suffixIcon,
            contentPadding: contentPadding ?? const EdgeInsets.all(16.0),
            filled: filled,
            fillColor: fillColor,
            border: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
    );
  }
}