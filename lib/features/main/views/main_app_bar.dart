import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hollo/core/core.dart';

import '../cubits/cubits.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Size get preferredSize => Size(double.infinity, 70.w);

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainCubit>();

    return AppBar(
      centerTitle: false,
      elevation: 2,
      title: Text(
        'Hollo!',
        style: TStyles.h4(color: MyColor.text),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.settings,
              color: MyColor.text,
            ),
          ),
        ),
      ],
      bottom: TabBar(
        controller: tabController,
        tabs: const [
          Tab(text: 'Message'),
          Tab(text: 'Friends'),
        ],
        onTap: (index) => mainCubit.setTabByIndex(index),
      ),
    );
  }
}
