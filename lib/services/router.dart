import 'package:expense_tracker/presentation/screens/base_screen.dart';
import 'package:expense_tracker/presentation/screens/landing_screen.dart';
import 'package:expense_tracker/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/base_screen',
      builder: (context, state) => const BaseScreen(),
    ),
    GoRoute(
        path: '/landing_screen',
        builder: (context, state) => const LandingScreen(),
        // routes: [
        //   GoRoute(
        //     path: 'detail_screen',
        //     builder: (context, state) {
        //       final data = state.extra as Map<String, String>;
        //       final title = data['title'] ?? '';
        //       final subtitle = data['subtitle'] ?? '';
        //       return DetailScreen(title: title, subtitle: subtitle);
        //     },
        //   ),
        // ]
    ),
  ],
);
