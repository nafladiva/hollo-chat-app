import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hollo/core/core.dart';
import 'package:hollo/shared/shared.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit()
      : super(
          const ContactState(
            loadStatus: ViewState.initial(),
          ),
        );

  Future<void> getAllContact() async {
    emit(state.copyWith(loadStatus: const ViewState.loading()));

    try {
      final uid = await const FlutterSecureStorage().read(key: 'uid');
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isNotEqualTo: uid)
          .get();

      List<UserMdl> result = [];
      for (final doc in snapshot.docs) {
        result.add(UserMdl.fromMap(doc.data()));
      }

      emit(
        state.copyWith(
          contactList: result,
          loadStatus: const ViewState.success(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(loadStatus: const ViewState.failed()));
    }
  }
}
