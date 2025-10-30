import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:charity_project_flutter/core/constant/app_colors.dart';
import 'package:charity_project_flutter/core/localization/app_text.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText; // Not translated here; pass localized text
  final String? hintText;  // Not translated here; pass localized text
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final double? width;   // default 325
  final double? height;  // default 75

  const CustomTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final double effectiveWidth = width ?? 325.w;
    final double effectiveHeight = height ?? 75.h;
    final double contentVerticalPadding = ((effectiveHeight) - 50.h) / 2;

    final borderRadius = BorderRadius.circular(40.r);

    return Container(
      width: effectiveWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (labelText != null && labelText!.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(bottom: 6.h, right: 6.w),
              child: AppText(
                labelText!,
                translation: false,
                textAlign: TextAlign.right,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  height: 1.43,
                ),
              ),
            ),
          Container(
            height: effectiveHeight,
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText,
              onChanged: onChanged,
              textAlign: TextAlign.right,
              textAlignVertical: TextAlignVertical.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                height: 1.6,
              ),
              decoration: InputDecoration(
                isDense: true,
                counterText: '',
                filled: true,
                fillColor: AppColors.textFiledBorder.withAlpha(127),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: contentVerticalPadding.clamp(0, double.infinity),
                ),
                hintText: hintText,
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  height: 1.64,
                ),
                border: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: const BorderSide(color: Colors.transparent, width: 0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(color: AppColors.primary, width: 1.5.w),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(color: theme.colorScheme.error, width: 1.5.w),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(color: theme.colorScheme.error, width: 1.5.w),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
