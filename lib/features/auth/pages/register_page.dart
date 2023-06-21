import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hollo/core/core.dart';
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
          padding: EdgeInsets.all(18.w),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register',
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
                    onChanged: authCubit.onChangePassword,
                  ),
                  SizedBox(height: 20.w),
                  if (state.authStatus.isFailed) ...[
                    Text(
                      'Error : ${state.authStatus.errorMessage}',
                      style: TStyles.p3(color: Colors.red),
                    ),
                    SizedBox(height: 10.w),
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
