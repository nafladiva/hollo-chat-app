import 'package:flutter/material.dart';
import 'package:hollo/core/core.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.onChanged,
    this.fillColor,
    this.hintText,
    this.obscureText = false,
    this.textInputType,
  });

  final Color? fillColor;
  final String? hintText;
  final TextInputType? textInputType;
  final bool obscureText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? MyColor.secondary.withOpacity(0.5),
        hintText: hintText,
        border: InputBorder.none,
      ),
    );
  }
}
