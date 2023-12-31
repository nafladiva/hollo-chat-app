import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/features/chat/pages/channel_list_page.dart';
import 'package:hollo/shared/widgets/my_button.dart';
import 'package:hollo/shared/widgets/my_text_field.dart';

import '../cubits/auth_cubit.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.isAuthenticated) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChannelListPage(),
                  ),
                  (route) => false,
                );
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register',
                    style: TStyles.h2(),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    hintText: 'Name',
                    onChanged: authCubit.onChangeName,
                  ),
                  const SizedBox(height: 12),
                  MyTextField(
                    hintText: 'Email',
                    textInputType: TextInputType.emailAddress,
                    onChanged: authCubit.onChangeEmail,
                  ),
                  const SizedBox(height: 12),
                  MyTextField(
                    hintText: 'Username',
                    onChanged: authCubit.onChangeUsername,
                  ),
                  const SizedBox(height: 12),
                  MyTextField(
                    hintText: 'Password',
                    onChanged: authCubit.onChangePassword,
                  ),
                  const SizedBox(height: 20),
                  if (state.authStatus.isFailed) ...[
                    Text(
                      'Error : ${state.authStatus.errorMessage}',
                      style: TStyles.p3(color: Colors.red),
                    ),
                    const SizedBox(height: 10),
                  ],
                  if (state.authStatus.isLoading) ...[
                    const CircularProgressIndicator(),
                  ] else ...[
                    MyButton(
                      text: 'Submit',
                      onTap: authCubit.register,
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
