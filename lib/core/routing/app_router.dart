import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:charity_project_flutter/core/routing/app_routes.dart';
import 'package:charity_project_flutter/features/splassh_screen/presentation/pages/splash_screen_page.dart';
import 'package:charity_project_flutter/features/onboarding/presentation/pages/onboarding_page_one.dart';
import 'package:charity_project_flutter/features/onboarding/presentation/pages/onboarding_page_two.dart';
import 'package:charity_project_flutter/features/auth/presentation/pages/signup_page.dart';
import 'package:charity_project_flutter/features/auth/presentation/pages/login_page.dart';

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
      GoRoute(
        path: AppRoutes.onboardingPageTwo,
        name: 'onboardingPageTwo',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const OnboardingPageTwo()),
      ),
      GoRoute(
        path: AppRoutes.signup,
        name: 'signup',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const SignupPage()),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const LoginPage()),
      ),
    ],
  );
}

