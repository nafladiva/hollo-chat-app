import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/features/auth/cubits/auth_cubit.dart';
import 'package:hollo/features/auth/pages/login_page.dart';
import 'package:hollo/features/chat/pages/channel_list_page.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    super.key,
    required this.client,
  });

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.authStatus.isSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => state.isAuthenticated
                  ? const ChannelListPage()
                  : const LoginPage(),
            ),
            (_) => false,
          );
        }
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
                style: GoogleFonts.bungee(
                  textStyle: TStyles.h1(color: MyColor.lightText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
