import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/core.dart';
import 'features/auth/cubits/auth_cubit.dart';
import 'features/splash/pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await StreamChatService.init();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..initial(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          title: 'Hollo',
          theme: Themes.init,
          // builder: (context, widget) {
          //   return StreamChat(
          //     client: client,
          //     child: widget,
          //   );
          // },
          home: const SplashPage(),
        ),
      ),
    );
  }
}
