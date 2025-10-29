import 'package:charity_project_flutter/core/component/custom_outlined_button.dart';
import 'package:charity_project_flutter/core/localization/app_text.dart';
import 'package:charity_project_flutter/core/localization/locale_keys.g.dart';
import 'package:charity_project_flutter/core/shared/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../gen/assets.gen.dart';

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppScaffold.clean(
      body: Container(
        //* Background image
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.png.onPoardingBackground.path),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: SizedBox()),
                //* Text content
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: AppText(
                        LocaleKeys.onboarding_title,
                        style: theme.textTheme.displayMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          height: 1.60,
                          fontSize: 30.sp,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      child: AppText(
                        LocaleKeys.onboarding_description,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          height: 1.80,
                          fontSize: 20.sp,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                //* Button
                CustomOutlinedButton(
                  text: LocaleKeys.onboarding_continue,
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

