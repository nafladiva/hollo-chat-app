import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/shared/shared.dart';
import 'package:zego_zim/zego_zim.dart';

import '../cubit/cubit.dart';
import '../widgets/widgets.dart';
import 'widgets/widgets.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
    required this.contact,
  });

  final UserMdl contact;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late ChatDetailCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ChatDetailCubit()..getMessage(widget.contact.uid);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<ChatDetailCubit, ChatDetailState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(
                'Jennie Ruby Jane',
                style: TStyles.sh3(color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    //TODO: get message hjstory
                    ...state.messages.map(
                      (message) {
                        if (message.type == ZIMMessageType.text) {
                          return ChatBubble(
                            message: (message as ZIMTextMessage).message,
                          );
                        }

                        return const SizedBox();
                      },
                    ),

                    // ChatBubble.opponent(message: 'Holloooo!'),
                    // ChatBubble.opponent(message: 'How you doing'),
                    // ChatBubble(message: 'I\'m good :)'),
                    // ChatBubble(message: 'How bout u?'),
                    // ChatBubble(
                    //   message:
                    //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                    // ),
                    // ChatBubble(message: 'GIRL'),
                    // ChatBubble(message: 'new song when'),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: InputMessageField(contact: widget.contact),
          );
        },
      ),
    );
  }
}
