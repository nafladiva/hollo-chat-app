import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/services/service.dart';
import 'package:zego_zim/zego_zim.dart';

part 'chat_detail_state.dart';

class ChatDetailCubit extends Cubit<ChatDetailState> {
  ChatDetailCubit()
      : super(
          const ChatDetailState(
            loadStatus: ViewState.initial(),
          ),
        );

  Future<void> getMessage(String conversationId) async {
    emit(state.copyWith(loadStatus: const ViewState.loading()));

    try {
      final result = await ZegoService.getMessage(conversationId);
      log('message : ${result.messageList}');

      emit(state.copyWith(
        messages: result.messageList,
        loadStatus: const ViewState.failed(),
      ));
    } catch (e) {
      emit(state.copyWith(loadStatus: const ViewState.failed()));
    }
  }
}
