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

class LoginFormWeb extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginFormWeb({super.key, required this.emailController, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          clipBehavior: Clip.antiAlias,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(Assets.images.png.bosstaniLogo.path, width: 120.w, height: 120.w),
                ),
                SizedBox(height: 16.h),
                AppText(
                  isAutoScale: true,
                  LocaleKeys.login_title,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w600, color: AppColors.primary),
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                  width: double.infinity,
                  height: 75.h,
                  labelText: LocaleKeys.login_emailLabel.tr(),
                  hintText: LocaleKeys.login_emailHint.tr(),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                CustomTextField(
                  width: double.infinity,
                  height: 75.h,
                  labelText: LocaleKeys.login_passwordLabel.tr(),
                  hintText: LocaleKeys.login_passwordHint.tr(),
                  controller: passwordController,
                  obscureText: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: AppText(
                      isAutoScale: true,
                      LocaleKeys.login_forgotPassword,
                      style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.secondary, fontSize: 8.sp),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: CustomFilledButton(
                    text: LocaleKeys.login_submit,
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
                      isAutoScale: true,
                      LocaleKeys.login_noAccount,
                      style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 8.sp),
                    ),
                    TextButton(
                      onPressed: () => context.go(AppRoutes.signup),
                      child: AppText(
                        isAutoScale: true,
                        LocaleKeys.login_createAccount,
                        style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.secondary, fontSize: 8.sp),
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


