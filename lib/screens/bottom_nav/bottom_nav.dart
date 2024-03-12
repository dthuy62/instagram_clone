import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/assets/app_assets.dart';
import '../../common/extensions/extensions.dart';
import '../../common/extensions/strings.dart';
import '../../models/apps/bottom_nav_type.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.child,
  });

  final Widget child;

  int _caculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString().toEnum;
    return switch (location) {
      BottomNavType.home => 0,
      BottomNavType.search => 1,
      BottomNavType.reels => 2,
      BottomNavType.account => 3,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: AppAssets.init.iconHomeActive.widget(),
            icon: AppAssets.init.iconHomeInactive.widget(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: AppAssets.init.iconSearchInactive.widget(),
            label: '',
          ),
          BottomNavigationBarItem(
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
