import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/features/chat/pages/channel_list_page.dart';
import 'package:hollo/shared/widgets/my_button.dart';
import 'package:hollo/shared/widgets/my_text_field.dart';

import '../cubits/auth_cubit.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                    'HOLLO',
                    style: GoogleFonts.bungee(
                      textStyle: TStyles.h2(color: MyColor.primary),
                    ),
                  ),
                  Text(
                    'Communicate as its fine!',
                    style: TStyles.p1(),
                  ),
                  const SizedBox(height: 50),
                  MyTextField(
                    hintText: 'Email',
                    textInputType: TextInputType.emailAddress,
                    onChanged: authCubit.onChangeEmail,
                  ),
                  const SizedBox(height: 12),
                  MyTextField(
                    hintText: 'Password',
                    obscureText: true,
                    onChanged: authCubit.onChangePassword,
                  ),
                  const SizedBox(height: 30),
                  if (state.authStatus.isLoading) ...[
                    const CircularProgressIndicator(),
                  ] else ...[
                    MyButton(
                      text: 'Login',
                      onTap: authCubit.login,
                    ),
                  ],
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create an account?',
                        style: TStyles.sh3(),
                      ),
                      TextButton(
                        onPressed: () {
                          authCubit.resetState();
                          Navigator.pushReplacement(
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
