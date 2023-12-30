import 'package:hollo/shared/config/env_config.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class StreamChatService {
  static late StreamChatClient client;

  static Future<void> connectUser({
    required User user,
    required String token,
  }) async {
    await client.connectUser(
      user,
      token,
    );
  }

  static Future<void> disconnectUser() async {
    await client.disconnectUser();
  }

  static Future<Channel> createChannel({
    required String channelId,
    required String name,
    List<String> members = const [],
  }) async {
    final channel = client.channel(
      'messaging',
      id: channelId,
      extraData: <String, dynamic>{
        'name': name,
        'members': members,
      },
    );
    await channel.create();

    channel.watch();
    return channel;
  }

  static Future<Channel> watchChannel({required String channelId}) async {
    final channel = client.channel(
      'messaging',
      id: channelId,
    );
    channel.watch();
    return channel;
  }

  static Future<void> deleteChannel({
    required String channelId,
  }) async {
    await client.deleteChannel(channelId, 'messaging');
  }

  static Future<void> init() async {
    client = StreamChatClient(
      EnvConfig.streamApiKey,
      logLevel: Level.INFO,
    );
  }
}
