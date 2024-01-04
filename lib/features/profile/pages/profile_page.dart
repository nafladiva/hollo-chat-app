import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/features/auth/cubits/auth_cubit.dart';
import 'package:hollo/features/profile/repositories/profile_repository.dart';
import 'package:hollo/shared/widgets/my_button.dart';

import '../cubit/profile_cubit.dart';
import 'widgets/profile_picture.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ProfileCubit(repository: ProfileRepositoryImpl());
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
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
                  const ProfilePicture(),
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
      ),
    );
  }
}
