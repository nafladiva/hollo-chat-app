import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hollo/core/text_styles.dart';
import 'package:hollo/services/stream_chat_service.dart';
import 'package:hollo/shared/consts/user_const.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'channel_page.dart';

class ChannelListPage extends StatefulWidget {
  const ChannelListPage({
    super.key,
    required this.client,
  });

  final StreamChatClient client;

  @override
  State<ChannelListPage> createState() => _ChannelListPageState();
}

class _ChannelListPageState extends State<ChannelListPage> {
  late final _controller = StreamChannelListController(
    client: widget.client,
    filter: Filter.in_(
      'members',
      [StreamChat.of(context).currentUser!.id],
    ),
    channelStateSort: const [SortOption('last_message_at')],
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hollo',
          style: TStyles.h3(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // TODO: user should be able to choose other account through some contact

          await StreamChatService.createChannel(
            channelId: 'user1_user3',
            name: 'Jensetter',
            members: [UserConst.idUser1, UserConst.idUser3],
          ).then(
            (channel) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => StreamChannel(
                  channel: channel,
                  child: const ChannelPage(),
                ),
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          size: 28,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _controller.refresh,
        child: StreamChannelListView(
          controller: _controller,
          onChannelTap: (channel) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => StreamChannel(
                channel: channel,
                child: const ChannelPage(),
              ),
            ),
          ),
          onChannelLongPress: (channel) => showCupertinoDialog(
            context: context,
            builder: (context) => DeleteAlertDialog(channel: channel),
          ),
        ),
      ),
    );
  }
}

class DeleteAlertDialog extends StatelessWidget {
  const DeleteAlertDialog({
    super.key,
    required this.channel,
  });

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        'Delete chat',
        style: TStyles.h3(),
      ),
      content: Text(
        'Are you sure want to delete this chat?',
        style: TStyles.p1(),
      ),
      actions: [
        CupertinoDialogAction(
          child: const Text('No'),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          child: const Text('Yes'),
          onPressed: () async => await StreamChatService.deleteChannel(
            channelId: channel.id ?? '',
          ).then((_) => Navigator.pop(context)),
        ),
      ],
    );
  }
}
