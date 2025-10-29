import 'package:charity_project_flutter/core/constant/app_colors.dart';
import 'package:charity_project_flutter/core/shared/app_scaffold.dart';
import 'package:charity_project_flutter/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

import '../../../../gen/assets.gen.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() {
    Timer(const Duration(seconds: 4), () {
      if (mounted) {
        context.go(AppRoutes.onboardingPageOne);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold.clean(
      body: Stack(
        children: [
          //* Outer circle
          Positioned(
            left: 27.w,
            top: 254.h,
            child: Container(
              width: 336.w,
              height: 336.h,
              decoration: ShapeDecoration(
                color: AppColors.secondary.withAlpha(12),
                shape: OvalBorder(
                  side: BorderSide(
                    width: 1.w,
                    color: AppColors.primary.withAlpha(76),
                  ),
                ),
              ),
            ),
          ),
          //* Middle circle
          Positioned(
            left: 46.w,
            top: 273.h,
            child: Container(
              width: 299.w,
              height: 299.h,
              decoration: ShapeDecoration(
                color: AppColors.secondary.withAlpha(25),
                shape: OvalBorder(
                  side: BorderSide(
                    width: 1.w,
                    color: AppColors.primary.withAlpha(51),
                  ),
                ),
              ),
            ),
          ),
          //* Image
          Positioned(
            left: 83.w,
            top: 310.h,
            child: Container(
              width: 224.w,
              height: 224.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.images.png.bosstaniLogo.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

