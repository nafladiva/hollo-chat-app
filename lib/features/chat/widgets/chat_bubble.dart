import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Row(
      mainAxisAlignment:
          isOpponent ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: 1.sw - 70.w,
          ),
          padding: EdgeInsets.all(10.w),
          margin: EdgeInsets.only(bottom: 6.w),
          decoration: BoxDecoration(
            color: isOpponent ? MyColor.primary : MyColor.secondary,
            borderRadius: BorderRadius.circular(10.r),
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
