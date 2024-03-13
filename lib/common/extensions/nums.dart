import '../../models/apps/bottom_nav_type.dart';

extension IntX on int {
  BottomNavType get toEnumBottomNavType {
    if (this == 0) {
      return BottomNavType.home;
    }
    if (this == 1) {
      return BottomNavType.search;
    }
    if (this == 2) {
      return BottomNavType.reels;
    }
    return BottomNavType.account;
  }
}
