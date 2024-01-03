import 'package:flutter/material.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/features/chat/pages/channel_page.dart';
import 'package:hollo/services/flutter_secure_storage_service.dart';
import 'package:hollo/services/stream_chat_service.dart';
import 'package:hollo/shared/consts/storage_key.dart';
import 'package:hollo/shared/shared.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.contact,
  });

  final UserMdl contact;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final uid =
            await FlutterSecureStorageService.get(key: StorageKey.uid) ?? '';

        await StreamChatService.createChannel(
          channelId: '${uid}_${contact.uid}',
          members: [uid, contact.uid],
        ).then(
          (channel) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => StreamChannel(
                  channel: channel,
                  child: const ChannelPage(),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundColor: MyColor.secondary,
            ),
            const SizedBox(width: 14),
            Text(
              contact.name,
              style: TStyles.sh2(),
            ),
          ],
        ),
      ),
    );
  }
}
