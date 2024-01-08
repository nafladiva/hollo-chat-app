import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/features/auth/cubits/auth_cubit.dart';
import 'package:hollo/features/profile/repositories/profile_repository.dart';

import '../cubit/profile_cubit.dart';
import 'widgets/profile_picture.dart';
import '../../../shared/widgets/username_box.dart';

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
          elevation: 0,
          title: Text(
            'Profile',
            style: TStyles.h4(color: MyColor.lightText),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: InkWell(
                onTap: authCubit.logout,
                child: const Icon(
                  Icons.logout_rounded,
                  color: MyColor.lightText,
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: MyColor.primary,
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const ProfilePicture(),
                        const SizedBox(height: 30),
                        Text(
                          authCubit.state.user?.name ?? '',
                          style: TStyles.h3(
                            color: MyColor.lightText,
                          ),
                        ),
                        const SizedBox(height: 15),
                        UsernameBox(
                          username: authCubit.state.user?.username ?? '',
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Share Profile',
                        style: TStyles.p1(),
                      ),
                      const SizedBox(height: 10),
                      // list tile (share your username, show qr code)
                      // logout
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
