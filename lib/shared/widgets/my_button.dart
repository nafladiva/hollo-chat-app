import 'package:flutter/material.dart';
import 'package:hollo/core/core.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColor.primary,
        elevation: 1,
      ),
      child: Text(
        text,
        style: TStyles.sh4(),
      ),
    );
  }
}
