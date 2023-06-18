import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hollo/core/core.dart';

class PersonTile extends StatelessWidget {
  const PersonTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.w),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: MyColor.secondary,
                ),
                SizedBox(width: 14.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nafla Diva',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TStyles.sh2(),
                    ),
                    SizedBox(height: 3.w),
                    Text(
                      'How you doing?',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TStyles.p3(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
