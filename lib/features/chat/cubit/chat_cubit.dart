import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hollo/core/view_state.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState(loadStatus: ViewState.initial()));

  /// for personal chat
  Future<void> getOpponentProfile(
    BuildContext context, {
    required Channel channel,
  }) async {
    emit(state.copyWith(loadStatus: const ViewState.loading()));

    try {
      final allMember = await channel.queryMembers(
        filter: Filter.and([
          Filter.notEqual('id', StreamChat.of(context).currentUser!.id),
        ]),
      );

      emit(state.copyWith(
        loadStatus: const ViewState.failed(),
        opponent: allMember.members.first,
      ));
    } catch (_) {
      emit(state.copyWith(loadStatus: const ViewState.failed()));
    }
  }
}
