import 'package:flutter/material.dart';
import 'package:hollo/core/core.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
  }) : isOpponent = false;

  const ChatBubble.opponent({
    super.key,
    required this.message,
  }) : isOpponent = true;

  final bool isOpponent;
  final String message;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment:
          isOpponent ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: screenWidth - 70,
          ),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 6),
          decoration: BoxDecoration(
            color: isOpponent ? MyColor.primary : MyColor.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            message,
            style: TStyles.p2(),
          ),
        ),
      ],
    );
  }
}
