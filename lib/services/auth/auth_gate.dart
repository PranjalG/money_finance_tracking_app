import 'package:expense_tracker/presentation/screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthGate extends StatelessWidget {
  final String clientId;
  final GoRouter router;

  const AuthGate({
    super.key,
    required this.clientId,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(                                       // Modify from here...
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
            return const SignInScreen();

        }
        return MaterialApp.router(
          routerConfig: router,
        );
      },
    );
  }
}
