part of 'chat_detail_cubit.dart';

class ChatDetailState extends Equatable {
  final ViewState loadStatus;
  final List<ZIMMessage> messages;

  const ChatDetailState({
    required this.loadStatus,
    this.messages = const [],
  });

  ChatDetailState copyWith({
    ViewState? loadStatus,
    List<ZIMMessage>? messages,
  }) {
    return ChatDetailState(
      loadStatus: loadStatus ?? this.loadStatus,
      messages: messages ?? this.messages,
    );
  }

  @override
  List<Object?> get props => [loadStatus, messages];
}
