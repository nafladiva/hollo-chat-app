import 'package:hollo/shared/config/env_config.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class StreamChatService {
  static late StreamChatClient client;

  static Future<void> connectUser({
    required User user,
    String? token,
  }) async {
    /// using GetStream development env
    await client.connectUser(
      user,
      client.devToken(user.id).rawValue,
    );
  }

  static Future<void> disconnectUser() async {
    await client.disconnectUser();
  }

  static Future<Channel> createChannel({
    required String channelId,
    String? name,
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
    //TODO: handle DioException 403 (channel_member cannot delete chat)
    await client.deleteChannel(channelId, 'messaging');
  }

  static Future<void> init() async {
    client = StreamChatClient(
      EnvConfig.streamApiKey,
      logLevel: Level.INFO,
    );
  }
}
