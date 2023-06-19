import 'package:flutter/material.dart';
import 'package:hollo/core/core.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.fillColor,
    this.hintText,
    this.textInputType,
  });

  final Color? fillColor;
  final String? hintText;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? MyColor.secondary.withOpacity(0.5),
        hintText: hintText,
        border: InputBorder.none,
      ),
    );
  }
}
