import 'package:charity_project_flutter/core/component/custom_filled_button.dart';
import 'package:charity_project_flutter/core/component/custom_text_field.dart';
import 'package:charity_project_flutter/core/localization/app_text.dart';
import 'package:charity_project_flutter/core/localization/locale_keys.g.dart';
import 'package:charity_project_flutter/core/shared/app_scaffold.dart';
import 'package:charity_project_flutter/core/constant/app_colors.dart';
import 'package:charity_project_flutter/gen/assets.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:charity_project_flutter/core/routing/app_routes.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
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
                Image.asset(Assets.images.png.bosstaniLogo.path, width: 118.w,height: 118.h,),
                SizedBox(height: 24.h),
                AppText(
                  LocaleKeys.signup_title,
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  width: double.infinity,
                  height: 75.h,
                  labelText: LocaleKeys.signup_usernameLabel.tr(),
                  hintText: LocaleKeys.signup_usernameHint.tr(),
                  controller: _nameController,
                ),

                CustomTextField(
                  width: double.infinity,
                  height: 75.h,
                  labelText: LocaleKeys.signup_emailLabel.tr(),
                  hintText: LocaleKeys.signup_emailHint.tr(),
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
                CustomTextField(
                  width: double.infinity,
                  height: 75.h,
                  labelText: LocaleKeys.signup_passwordLabel.tr(),
                  hintText: LocaleKeys.signup_passwordHint.tr(),
                  controller: _passwordController,
                  obscureText: true,
                ),
                 SizedBox(height: 43.h),
                 Center(
                   child: CustomFilledButton(
                     text: LocaleKeys.signup_submit,
                     height: 48.h,
                     width: 233.w,
                     onPressed: () {
                       // TODO: handle sign up
                     },
                   ),
                 ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      LocaleKeys.signup_haveAccount,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                     TextButton(
                       onPressed: () => context.push(AppRoutes.login),
                      child: AppText(
                        LocaleKeys.signup_login,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w700,
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
