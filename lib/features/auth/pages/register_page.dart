import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/features/main_page/pages/pages.dart';
import 'package:hollo/shared/shared.dart';

import '../cubits/cubits.dart';

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
                    builder: (context) => const MainPage(),
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
                    hintText: 'Email',
                    textInputType: TextInputType.emailAddress,
                    onChanged: authCubit.onChangeEmail,
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
                  MyButton(
                    text: 'Submit',
                    onTap: authCubit.register,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
