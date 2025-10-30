import 'package:charity_project_flutter/core/component/custom_filled_button.dart';
import 'package:charity_project_flutter/core/component/custom_text_field.dart';
import 'package:charity_project_flutter/core/constant/app_colors.dart';
import 'package:charity_project_flutter/core/localization/app_text.dart';
import 'package:charity_project_flutter/core/localization/locale_keys.g.dart';
import 'package:charity_project_flutter/core/routing/app_routes.dart';
import 'package:charity_project_flutter/gen/assets.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignupFormWeb extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignupFormWeb({super.key, required this.nameController, required this.emailController, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          clipBehavior: Clip.antiAlias,
          child: Container(
            color: Colors.white.withOpacity(0.92),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(Assets.images.png.bosstaniLogo.path, width: 120.w, height: 120.w),
                ),
                SizedBox(height: 16.h),
                AppText(
                  LocaleKeys.signup_title,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w600, color: AppColors.primary),
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                  width: double.infinity,
                  height: 75.h,
                  labelText: LocaleKeys.signup_usernameLabel.tr(),
                  hintText: LocaleKeys.signup_usernameHint.tr(),
                  controller: nameController,
                ),
                CustomTextField(
                  width: double.infinity,
                  height: 75.h,
                  labelText: LocaleKeys.signup_emailLabel.tr(),
                  hintText: LocaleKeys.signup_emailHint.tr(),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                CustomTextField(
                  width: double.infinity,
                  height: 75.h,
                  labelText: LocaleKeys.signup_passwordLabel.tr(),
                  hintText: LocaleKeys.signup_passwordHint.tr(),
                  controller: passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 24.h),
                Center(
                  child: CustomFilledButton(
                    text: LocaleKeys.signup_submit,
                    height: 48.h,
                    width: 280.w,
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      LocaleKeys.signup_haveAccount,
                      style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 14.sp),
                    ),
                    TextButton(
                      onPressed: () => context.push(AppRoutes.login),
                      child: AppText(
                        LocaleKeys.signup_login,
                        style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.secondary, fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


