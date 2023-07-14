part of 'chat_list_cubit.dart';

class ChatListState extends Equatable {
  final ViewState loadStatus;
  final List<ZIMConversation> chatList;

  const ChatListState({
    required this.loadStatus,
    this.chatList = const [],
  });

  ChatListState copyWith({
    ViewState? loadStatus,
    List<ZIMConversation>? chatList,
  }) {
    return ChatListState(
      loadStatus: loadStatus ?? this.loadStatus,
      chatList: chatList ?? this.chatList,
    );
  }

  @override
  List<Object?> get props => [loadStatus, chatList];
}
