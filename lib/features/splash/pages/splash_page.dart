import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/features/auth/cubits/cubits.dart';
import 'package:hollo/features/auth/pages/pages.dart';
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
    // FOR TEST ONLY
    // context.read<AuthCubit>().logout();

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: need to fix auth state
        final toPage =
            state.isAuthenticated ? const ChannelListPage() : const LoginPage();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => toPage,
          ),
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
