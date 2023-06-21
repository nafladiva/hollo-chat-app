import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/widgets.dart';

class MessageListView extends StatelessWidget {
  const MessageListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.w, horizontal: 16.w),
        child: Column(
          children: [
            ...List.generate(
              8,
              (index) => const PersonTile(),
            ),
          ],
        ),
      ),
    );
  }
}
