import '../enums/enums.dart';

class TabHelper {
  static int getIndex(TabType tab) {
    switch (tab) {
      case TabType.message:
        return 0;
      case TabType.friend:
        return 1;
      default:
        return 0;
    }
  }
}
