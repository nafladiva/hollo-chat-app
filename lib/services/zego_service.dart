import 'dart:developer';

import 'package:hollo/shared/config/env_config.dart';
import 'package:zego_zim/zego_zim.dart';

import 'zim_event_manager.dart';

class ZegoService {
  static ZIMUserInfo? _userInfo;

  static ZIM get instance => ZIM.getInstance() ?? init();
  static ZIMUserInfo? get userInfo => _userInfo;

  static init() {
    ZIMAppConfig appConfig = ZIMAppConfig();
    appConfig.appID = EnvConfig.zegoAppId;
    appConfig.appSign = EnvConfig.zegoAppSign;

    ZIM.create(appConfig);

    ZIMEventManager.loadingEventHandler();
  }

  static Future<void> login(String id, String username, {String? token}) async {
    ZIMUserInfo userInfo = ZIMUserInfo();
    userInfo.userID = id;
    userInfo.userName = username;

    try {
      await instance.login(userInfo, token);

      /// initialize for instance
      _userInfo = userInfo;
    } catch (e) {
      log('$e');
    }
  }

  static renewToken(String token) async {
    await instance.renewToken(token);
  }

  static logout() {
    instance.logout();
    instance.destroy();
  }

  static Future<ZIMConversationListQueriedResult> getAllMessages() async {
    ZIMConversationQueryConfig config = ZIMConversationQueryConfig();

    return instance.queryConversationList(config);
  }

  static sendMessage(String message, String conversationId) {
    ZIMTextMessage textMessage = ZIMTextMessage(message: message);

    ZIMMessageSendConfig sendConfig = ZIMMessageSendConfig();
    sendConfig.priority = ZIMMessagePriority.medium;

    ZIMPushConfig pushConfig = ZIMPushConfig();
    pushConfig.title = "New message";
    pushConfig.content = message;
    sendConfig.pushConfig = pushConfig;

    ZIMConversationType type = ZIMConversationType.peer;

    // ZIMMessageSendNotification notification =
    //     ZIMMessageSendNotification(onMessageAttached: (message) {
    //   //  The callback on the message not sent yet. You can get a temporary object here and this object must be the same as that created zimMessage object. You can make your own business logic using this as needed, for example, display a UI ahead of time.
    // });

    instance.sendMessage(textMessage, conversationId, type, sendConfig);
    //     .then(
    //       (value) => {
    //         // The callback on the results of message sending.
    //       },
    //     )
    //     .catchError(
    //   (onError) {
    //     // This callback can be used to catch the reason for message sending failure.
    //   },
    // );
  }
}
