import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollo/core/my_color.dart';
import 'package:hollo/features/auth/cubits/auth_cubit.dart';
import 'package:image_picker/image_picker.dart';

import '../../cubit/profile_cubit.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    final authCubit = context.read<AuthCubit>();

    return InkWell(
      onTap: () async {
        final selectedPic = await ImagePicker().pickImage(
          source: ImageSource.gallery,
        );

        if (selectedPic != null) {
          await profileCubit.updateProfilePicture(
            picture: File(selectedPic.path),
          );
          await authCubit.getUserData();
        }
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final isProfilePicExist = state.user?.profilePic.isNotEmpty ?? false;

          return Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              image: isProfilePicExist
                  ? DecorationImage(
                      image: NetworkImage(state.user?.profilePic ?? ''),
                      fit: BoxFit.cover,
                    )
                  : null,
              color: MyColor.secondary,
              shape: BoxShape.circle,
              border: Border.all(
                width: 8.0,
                color: Colors.white.withOpacity(0.2),
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
          );
        },
      ),
    );
  }
}
