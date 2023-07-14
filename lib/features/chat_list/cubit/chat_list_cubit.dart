import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/services/service.dart';
import 'package:zego_zim/zego_zim.dart';

part 'chat_list_state.dart';

class ChatListCubit extends Cubit<ChatListState> {
  ChatListCubit()
      : super(
          const ChatListState(
            loadStatus: ViewState.initial(),
          ),
        );

  Future<void> getChatList() async {
    emit(state.copyWith(loadStatus: const ViewState.loading()));

    try {
      final result = await ZegoService.getAllMessages();

      emit(state.copyWith(
        loadStatus: const ViewState.success(),
        chatList: result.conversationList,
      ));
    } catch (e) {
      emit(state.copyWith(loadStatus: const ViewState.failed()));
    }
  }
}
