import 'package:flutter/material.dart';

class MyOptionsBottomSheet extends StatelessWidget {
  const MyOptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(18),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //TODO: add custom options
            Text('Bottom sheet'),
          ],
        ),
      ),
    );
  }
}
