import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/features/auth/cubits/cubits.dart';
import 'package:hollo/features/auth/pages/pages.dart';
import 'package:hollo/features/main/pages/pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => state.isAuthenticated
                    ? const MainPage()
                    : const LoginPage(),
              ),
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: MyColor.primary,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'HOLLO!',
                style: TStyles.h1(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
