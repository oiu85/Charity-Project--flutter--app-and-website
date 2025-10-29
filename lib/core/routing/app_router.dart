import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:charity_project_flutter/core/routing/app_routes.dart';
import 'package:charity_project_flutter/features/onboarding/presentation/pages/page_one.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const PageOne()),
      ),
      GoRoute(
        path: AppRoutes.onboardingPageOne,
        name: 'onboardingPageOne',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const PageOne()),
      ),
    ],
  );
}

