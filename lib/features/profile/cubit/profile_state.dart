part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final ViewState loadStatus;

  const ProfileState({
    required this.loadStatus,
  });

  ProfileState copyWith({
    ViewState? loadStatus,
  }) {
    return ProfileState(
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }

  @override
  List<Object?> get props => [loadStatus];
}
