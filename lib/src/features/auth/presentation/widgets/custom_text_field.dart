import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final bool filled;
  final Color? fillColor;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffix,
    this.validator,
    this.borderRadius,
    this.contentPadding,
    this.filled = false,
    this.fillColor,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.labelStyle,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: textStyle,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        filled: filled,
        fillColor: fillColor,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffix: suffix,
        contentPadding: contentPadding ?? const EdgeInsets.all(16),
        border: border ??
            OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
            ),
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        labelStyle: labelStyle,
      ),
      validator: validator ?? (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $labelText';
        }
        return null;
      },
    );
  }
}