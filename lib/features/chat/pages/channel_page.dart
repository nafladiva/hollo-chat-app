import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'opponent_profile_page.dart';

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    super.key,
    required this.channel,
  });

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return StreamChannel(
      channel: channel,
      child: Scaffold(
        appBar: StreamChannelHeader(
          onImageTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => OpponentProfilePage(channel: channel),
              ),
            );
          },
        ),
        body: const Column(
          children: <Widget>[
            Expanded(
              child: StreamMessageListView(),
            ),
            StreamMessageInput(),
          ],
        ),
      ),
    );
  }
}
