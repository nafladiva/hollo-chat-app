part of 'main_cubit.dart';

class MainState extends Equatable {
  final TabType tabType;

  const MainState({
    this.tabType = TabType.message,
  });

  bool get isOnMessage => tabType == TabType.message;
  bool get isOnFriend => tabType == TabType.friend;

  MainState copyWith({
    TabType? tabType,
  }) {
    return MainState(
      tabType: tabType ?? this.tabType,
    );
  }

  @override
  List<Object?> get props => [tabType];
}
