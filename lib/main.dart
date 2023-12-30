import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollo/features/auth/cubits/cubits.dart';
import 'package:hollo/features/auth/repositories/repositories.dart';
import 'package:hollo/shared/consts/user_const.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'core/core.dart';
import 'features/chat/pages/channel_list_page.dart';
import 'services/stream_chat_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await StreamChatService.init();

  // TODO: handle with auth
  await StreamChatService.connectUser(
    user: User(
      id: UserConst.idUser1,
      name: UserConst.nameUser1,
    ),
    token: UserConst.tokenUser1,
  );

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
      child: MaterialApp(
        title: 'Hollo',
        theme: Themes.init,
        builder: (context, widget) {
          return StreamChat(
            client: client,
            child: widget,
          );
        },
        home: StreamChat(
          client: client,
          child: ChannelListPage(
            client: client,
          ),
        ),
      ),
    );
  }
}
