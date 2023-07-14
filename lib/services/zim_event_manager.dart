import 'dart:developer';

import 'package:zego_zim/zego_zim.dart';

class ZIMEventManager {
  static loadingEventHandler() {
    ZIMEventHandler.onConnectionStateChanged =
        (zim, state, event, extendedData) {
      log('onConnectionStateChanged');
    };

    ZIMEventHandler.onTokenWillExpire = (zim, second) {
      //TODO: generate new token from backend
    };

    ZIMEventHandler.onReceivePeerMessage = (zim, messageList, fromUserID) {
      for (ZIMMessage message in messageList) {
        switch (message.type) {
          case ZIMMessageType.text:
            message as ZIMTextMessage;
            break;
          case ZIMMessageType.command:
            message as ZIMCommandMessage;
            break;
          case ZIMMessageType.image:
            message as ZIMImageMessage;
            break;
          case ZIMMessageType.file:
            message as ZIMFileMessage;
            break;
          default:
        }
      }
    };
  }
}
