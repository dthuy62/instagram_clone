import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/authentication/authentication_cubit.dart';
import '../../navigation/navigation.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Account Screen')),
          OutlinedButton(
            onPressed: () {
              context.read<AuthenticationCubit>().setUnauthenticated();
              context.go(NavigationPath.login);
            },
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
