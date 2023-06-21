import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/shared/shared.dart';

import '../cubits/cubits.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(18.w),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TStyles.h2(),
                  ),
                  SizedBox(height: 25.w),
                  MyTextField(
                    hintText: 'Email',
                    textInputType: TextInputType.emailAddress,
                    onChanged: authCubit.onChangeEmail,
                  ),
                  SizedBox(height: 12.w),
                  MyTextField(
                    hintText: 'Password',
                    obscureText: true,
                    onChanged: authCubit.onChangePassword,
                  ),
                  SizedBox(height: 20.w),
                  if (state.authStatus.isLoading) ...[
                    const CircularProgressIndicator(),
                  ] else ...[
                    MyButton(
                      text: 'Login',
                      onTap: authCubit.login,
                    ),
                  ],
                  SizedBox(height: 15.w),
                  TextButton(
                    onPressed: () {
                      authCubit.resetState();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Register',
                      style: TStyles.sh3(color: MyColor.primary),
                    ),
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
