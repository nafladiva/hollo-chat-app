import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/shared/consts/assets_path.dart';
import 'package:hollo/shared/widgets/username_box.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../cubit/chat_cubit.dart';

class OpponentProfilePage extends StatefulWidget {
  const OpponentProfilePage({
    super.key,
    required this.channel,
  });

  final Channel channel;

  @override
  State<OpponentProfilePage> createState() => _OpponentProfilePageState();
}

class _OpponentProfilePageState extends State<OpponentProfilePage> {
  late ChatCubit chatCubit;

  @override
  void initState() {
    super.initState();

    chatCubit = ChatCubit();
    chatCubit.getOpponentProfile(context, channel: widget.channel);
  }

  @override
  void dispose() {
    chatCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: chatCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TStyles.h4(color: MyColor.lightText),
          ),
        ),
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            final isProfileExists =
                state.opponent?.user?.image?.isNotEmpty ?? false;

            if (state.loadStatus.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Center(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  CircleAvatar(
                    radius: 90,
                    backgroundColor: Colors.white,
                    backgroundImage: isProfileExists
                        ? NetworkImage(
                            state.opponent?.user?.image ?? '',
                          )
                        : const AssetImage(AssetsPath.emptyProfile)
                            as ImageProvider,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    state.opponent?.user?.name ?? '',
                    style: TStyles.h3(),
                  ),
                  const SizedBox(height: 15),
                  UsernameBox.dark(
                    username:
                        state.opponent?.user?.extraData['username'] as String,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
