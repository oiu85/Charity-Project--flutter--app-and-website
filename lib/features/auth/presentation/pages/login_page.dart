import 'package:charity_project_flutter/core/shared/app_scaffold.dart';
import 'package:charity_project_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:charity_project_flutter/core/shared/responsive.dart';
import 'package:charity_project_flutter/features/auth/presentation/widgets/login_form.dart';

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
    // final theme = Theme.of(context);

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
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = sizeClassFor(constraints) == AppSizeClass.desktop;
            final horizontalPadding = isDesktop ? 30.w : 24.w;
            final topPad = 48.h;

            final form = Padding(
              padding: EdgeInsets.only(top: topPad),
              child: LoginForm(
                emailController: _emailController,
                passwordController: _passwordController,
              ),
            );

            if (isDesktop) {
              return Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: SingleChildScrollView(child: form)),
                      // Right: image
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: topPad),
                          child: Image.asset(
                            Assets.images.png.auth.rightCoulmn.path,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: horizontalPadding, right: horizontalPadding),
                child: form,
              ),
            );
          },
        ),
      ),
    );
  }
}
