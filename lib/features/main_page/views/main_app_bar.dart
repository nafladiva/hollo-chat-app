import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/features/auth/cubits/cubits.dart';
import 'package:hollo/features/auth/pages/pages.dart';

import '../cubits/cubits.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Size get preferredSize => const Size(double.infinity, 70);

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    final mainCubit = context.read<MainCubit>();

    return BlocListener<AuthCubit, AuthState>(
      bloc: authCubit,
      listener: (context, state) {
        if (!state.isAuthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        }
      },
      child: AppBar(
        centerTitle: false,
        elevation: 2,
        title: Text(
          'Hollo!',
          style: TStyles.h4(color: MyColor.text),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: InkWell(
              onTap: () {
                //Temporary
                authCubit.logout();
              },
              child: const Icon(
                Icons.logout,
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
      ),
    );
  }
}
