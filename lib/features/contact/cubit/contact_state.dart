part of 'contact_cubit.dart';

class ContactState extends Equatable {
  final ViewState loadStatus;
  final List<UserMdl> contactList;

  const ContactState({
    required this.loadStatus,
    this.contactList = const [],
  });

  ContactState copyWith({
    ViewState? loadStatus,
    List<UserMdl>? contactList,
  }) {
    return ContactState(
      loadStatus: loadStatus ?? this.loadStatus,
      contactList: contactList ?? this.contactList,
    );
  }

  @override
  List<Object?> get props => [loadStatus, contactList];
}
