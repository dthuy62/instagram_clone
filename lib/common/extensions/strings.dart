import '../../models/apps/bottom_nav_type.dart';
import '../../navigation/navigation.dart';

extension StringsX on String {
  BottomNavType get toEnum {
    if (startsWith(NavigationPath.home)) {
      return BottomNavType.home;
    }
    if (startsWith(NavigationPath.search)) {
      return BottomNavType.search;
    }
    if (startsWith(NavigationPath.reels)) {
      return BottomNavType.reels;
    }
    return BottomNavType.account;
  }
}
