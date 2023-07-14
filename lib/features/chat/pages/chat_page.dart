import 'package:flutter/material.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/shared/shared.dart';

import '../widgets/widgets.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jennie Ruby Jane',
          style: TStyles.sh3(color: Colors.white10),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            children: [
              ChatBubble.opponent(message: 'Holloooo!'),
              ChatBubble.opponent(message: 'How you doing'),
              ChatBubble(message: 'I\'m good :)'),
              ChatBubble(message: 'How bout u?'),
              ChatBubble(
                message:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
              ),
              ChatBubble(message: 'GIRL'),
              ChatBubble(message: 'new song when'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: MyTextField(
                fillColor: MyColor.primary.withOpacity(0.15),
                hintText: 'Send a message...',
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.send,
              color: MyColor.primary,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
