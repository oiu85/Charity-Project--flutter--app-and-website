import 'package:charity_project_flutter/core/component/custom_filled_button.dart';
import 'package:charity_project_flutter/core/component/custom_text_field.dart';
import 'package:charity_project_flutter/core/constant/app_colors.dart';
import 'package:charity_project_flutter/core/localization/app_text.dart';
import 'package:charity_project_flutter/core/localization/locale_keys.g.dart';
import 'package:charity_project_flutter/core/routing/app_routes.dart';
import 'package:charity_project_flutter/core/shared/app_scaffold.dart';
import 'package:charity_project_flutter/gen/assets.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold.clean(
      body: Container(
        padding: EdgeInsets.only(top: 48.h),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.png.signUpBackGround.provider(),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  Assets.images.png.bosstaniLogo.path,
                  width: 118.w,
                  height: 118.h,
                ),
                SizedBox(height: 24.h),
                AppText(
                  LocaleKeys.login_title,
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  width: double.infinity,
                  height: 75.h,
                  labelText: LocaleKeys.login_emailLabel.tr(),
                  hintText: LocaleKeys.login_emailHint.tr(),
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
                CustomTextField(
                  width: double.infinity,
                  height: 75.h,
                  labelText: LocaleKeys.login_passwordLabel.tr(),
                  hintText: LocaleKeys.login_passwordHint.tr(),
                  controller: _passwordController,
                  obscureText: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: navigate to forgot password when available
                    },
                    child: AppText(
                      LocaleKeys.login_forgotPassword,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondary,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: CustomFilledButton(
                    text: LocaleKeys.login_submit,
                    height: 48.h,
                    width: 233.w,
                    onPressed: () {
                      // TODO: handle login
                    },
                  ),
                ),
                SizedBox(height: 18.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      LocaleKeys.login_noAccount,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.go(AppRoutes.signup),
                      child: AppText(
                        LocaleKeys.login_createAccount,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.secondary,
                          fontSize: 14.sp,
                        ),
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
