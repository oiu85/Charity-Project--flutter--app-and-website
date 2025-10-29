import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:charity_project_flutter/core/routing/app_routes.dart';
import 'package:charity_project_flutter/features/splassh_screen/presentation/pages/splash_screen_page.dart';
import 'package:charity_project_flutter/features/onboarding/presentation/pages/onboarding_page_one.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const SplashScreenPage()),
      ),
      GoRoute(
        path: AppRoutes.onboardingPageOne,
        name: 'onboardingPageOne',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const OnboardingPageOne()),
      ),
    ],
  );
}

