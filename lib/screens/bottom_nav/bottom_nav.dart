import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/assets/app_assets.dart';
import '../../common/extensions/extensions.dart';
import '../../common/extensions/strings.dart';
import '../../models/apps/bottom_nav_type.dart';
import '../../navigation/navigation.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.child,
  });

  final Widget child;

  BottomNavType _caculateSelectedIndex(BuildContext context) {
    return context.goRouterState.uri.toString().toEnum;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index.toEnumBottomNavType) {
      case BottomNavType.home:
        context.go(NavigationPath.home);
        break;
      case BottomNavType.search:
        context.go(NavigationPath.search);
        break;
      case BottomNavType.reels:
        context.go(NavigationPath.reels);
        break;
      case BottomNavType.account:
      default:
        context.go(NavigationPath.account);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _caculateSelectedIndex(context).index,
        onTap: (index) => _onItemTapped(context, index),
        items: [
          BottomNavigationBarItem(
            activeIcon: AppAssets.init.iconHomeActive.widget(),
            icon: AppAssets.init.iconHomeInactive.widget(),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: AppAssets.init.iconSearchActive.widget(),
            icon: AppAssets.init.iconSearchInactive.widget(),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: AppAssets.init.iconReelsActive.widget(),
            icon: AppAssets.init.iconReelsInactive.widget(),
            label: '',
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: 23.H,
              height: 23.H,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
