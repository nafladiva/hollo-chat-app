import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/features/chat/pages/channel_list_page.dart';
import 'package:hollo/shared/widgets/my_button.dart';
import 'package:hollo/shared/widgets/my_text_field.dart';

import '../cubits/auth_cubit.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    'HOLLO',
                    style: GoogleFonts.bungee(
                      textStyle: TStyles.h2(color: MyColor.primary),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Create new account',
                    style: TStyles.sh3(),
                  ),
                  const SizedBox(height: 40),
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
                    obscureText: true,
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TStyles.sh3(),
                      ),
                      TextButton(
                        onPressed: () {
                          authCubit.resetState();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Login here',
                          style: TStyles.sh3(color: MyColor.primary),
                        ),
                      ),
                    ],
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
