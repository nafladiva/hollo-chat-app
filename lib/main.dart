import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'core/core.dart';
import 'features/auth/cubits/auth_cubit.dart';
import 'features/auth/repositories/auth_repository.dart';
import 'features/splash/pages/splash_page.dart';
import 'services/stream_chat_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await StreamChatService.init();

  runApp(
    MyApp(
      client: StreamChatService.client,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.client,
  });

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        repository: AuthRepositoryImpl(),
      )..onBuild(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          title: 'Hollo',
          theme: Themes.init,
          builder: (context, widget) {
            return StreamChat(
              client: client,
              child: widget,
            );
          },
          home: SplashPage(
            client: client,
          ),
        ),
      ),
    );
  }
}
