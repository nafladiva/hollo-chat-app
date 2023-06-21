import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hollo/features/auth/cubits/cubits.dart';
import 'package:hollo/features/auth/repositories/repositories.dart';

import 'core/core.dart';
import 'features/splash/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => AuthCubit(
            repository: AuthRepositoryImpl(),
          )..onBuild(),
          child: MaterialApp(
            title: 'Hollo',
            theme: Themes.init,
            home: const SplashPage(),
          ),
        );
      },
    );
  }
}
