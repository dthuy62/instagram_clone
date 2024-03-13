import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/authentication/authentication_cubit.dart';
import '../common/error_screen.dart';
import '../screens/account/account.dart';
import '../screens/bottom_nav/bottom_nav.dart';
import '../screens/home/home.dart';
import '../screens/login/login.dart';
import '../screens/reels/reels.dart';
import '../screens/search/search.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

abstract class NavigationPath {
  NavigationPath._();

  static const home = '/home';
  static const login = '/';
  static const search = '/search';
  static const reels = '/reels';
  static const account = '/account';
}

abstract class AppRouter {
  AppRouter._();

  static final routerConfig = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: NavigationPath.login,
    redirect: (context, state) {
      final location = state.uri.toString();
      final isAuthenticated = context.read<AuthenticationCubit>().state;

      if (isAuthenticated) {
        return location == NavigationPath.login
            ? NavigationPath.home
            : location;
      } else {
        return null;
      }
    },
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (_, state, child) => BottomNav(child: child),
        routes: [
          GoRoute(
            path: NavigationPath.home,
            builder: (_, __) => const HomeScreen(),
          ),
          GoRoute(
            path: NavigationPath.search,
            builder: (_, __) => const SearchScreen(),
          ),
          GoRoute(
            path: NavigationPath.reels,
            builder: (_, __) => const ReelsScreen(),
          ),
          GoRoute(
            path: NavigationPath.account,
            builder: (_, __) => const AccountScreen(),
          ),
        ],
      ),
      GoRoute(
        path: NavigationPath.login,
        builder: (_, __) => const LoginScreen(),
      ),
    ],
    errorBuilder: (_, __) => const ErrorScreen(),
  );
}
