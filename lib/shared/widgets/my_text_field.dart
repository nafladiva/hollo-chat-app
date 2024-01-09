import 'package:flutter/material.dart';
import 'package:hollo/core/core.dart';

class MyTextField extends StatefulWidget {
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
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool showObscureText;

  @override
  void initState() {
    super.initState();
    showObscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      onChanged: widget.onChanged,
      obscureText: showObscureText,
      autocorrect: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fillColor ?? MyColor.secondary.withOpacity(0.5),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        label: Text(
          widget.hintText ?? '',
          style: const TextStyle(
            color: MyColor.primary,
            fontSize: 14.0,
          ),
        ),
        suffixIcon: widget.obscureText
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    showObscureText = !showObscureText;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: Icon(
                    showObscureText ? Icons.visibility_off : Icons.visibility,
                    color: MyColor.primary,
                    size: 22.0,
                  ),
                ),
              )
            : null,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
