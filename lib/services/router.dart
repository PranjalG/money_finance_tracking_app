import 'package:expense_tracker/presentation/screens/base_screen.dart';
import 'package:expense_tracker/presentation/screens/sign_in_screen.dart';
import 'package:expense_tracker/presentation/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/sign_in_screen',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/base_screen',
      builder: (context, state) => const BaseScreen(),
    ),
  ],
  redirect: (context, state) {
    final user = FirebaseAuth.instance.currentUser;
    final isLoggedIn = user != null;

    // while still loading Firebase, don’t redirect
    if (state.matchedLocation == '/splash') {
      return null;
    }

    // ✅ If not logged in → always go to /welcome
    if (!isLoggedIn && state.matchedLocation != '/sign_in_screen') {
      return '/sign_in_screen';
    }

    // ✅ If logged in → always go to /base_screen
    if (isLoggedIn && state.matchedLocation != '/base_screen') {
      return '/base_screen';
    }

    return null;
  },
);
