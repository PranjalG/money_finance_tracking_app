import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/splash_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }

        if (snapshot.hasData) {
          // logged in
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('/base_screen');
          });
        } else {
          // logged out
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('/sign_in_screen');
          });
        }

        return const SizedBox.shrink();
      },
    );
  }
}
