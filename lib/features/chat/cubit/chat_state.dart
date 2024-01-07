part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final ViewState loadStatus;
  final Member? opponent;

  const ChatState({
    required this.loadStatus,
    this.opponent,
  });

  ChatState copyWith({
    ViewState? loadStatus,
    Member? opponent,
  }) {
    return ChatState(
      loadStatus: loadStatus ?? this.loadStatus,
      opponent: opponent ?? this.opponent,
    );
  }

  @override
  List<Object?> get props => [loadStatus, opponent];
}
