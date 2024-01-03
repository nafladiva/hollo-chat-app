import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/features/auth/cubits/auth/auth_cubit.dart';
import 'package:hollo/shared/shared.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TStyles.sh1(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  width: 180,
                  height: 180,
                  decoration: const BoxDecoration(
                    color: MyColor.secondary,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  authCubit.state.user?.name ?? '',
                  style: TStyles.h3(),
                ),
                const SizedBox(height: 15),
                // TODO: add copy username widget
                Text(
                  authCubit.state.user?.username ?? '',
                  style: TStyles.sh3(),
                ),
                const SizedBox(height: 30),
                MyButton(
                  onTap: authCubit.logout,
                  text: 'Logout',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
