import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/authentication/authentication_cubit.dart';
import '../common/error_screen.dart';
import '../screens/bottom_nav/bottom_nav.dart';
import '../screens/home/home.dart';
import '../screens/login/login.dart';

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
    debugLogDiagnostics: true,
    initialLocation: NavigationPath.login,
    redirect: (context, _) {
      if (context.read<AuthenticationCubit>().state) {
        return NavigationPath.home;
      } else {
        return null;
      }
    },
    routes: [
      ShellRoute(
        builder: (_, state, child) => BottomNav(child: child),
        routes: [
          GoRoute(
            path: NavigationPath.home,
            builder: (_, __) => const HomeScreen(),
          ),
          GoRoute(
            path: NavigationPath.search,
            builder: (_, __) => const LoginScreen(),
          ),
          GoRoute(
            path: NavigationPath.reels,
            builder: (_, __) => const LoginScreen(),
          ),
          GoRoute(
            path: NavigationPath.account,
            builder: (_, __) => const LoginScreen(),
          ),
        ],
      ),
    ],
    errorBuilder: (_, __) => const ErrorScreen(),
  );
}
