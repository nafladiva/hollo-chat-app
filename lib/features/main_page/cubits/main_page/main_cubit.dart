import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../enums/enums.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  void moveToMessageTab() {
    emit(state.copyWith(tabType: TabType.message));
  }

  void moveToFriendTab() {
    emit(state.copyWith(tabType: TabType.friend));
  }

  void setTabByIndex(int index) {
    switch (index) {
      case 0:
        moveToMessageTab();
        break;
      case 1:
        moveToFriendTab();
        break;
      default:
        moveToMessageTab();
        break;
    }
  }
}
