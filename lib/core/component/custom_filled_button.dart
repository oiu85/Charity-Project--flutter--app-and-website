import 'package:charity_project_flutter/core/localization/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  const CustomFilledButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width ?? 342.w,
        height: height ?? 40.h,
        decoration: ShapeDecoration(
          color: backgroundColor ?? const Color(0xFF0D9D57),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 20.r,
            ),
          ),
        ),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
        alignment: Alignment.center,
        child: AppText(
          text,
          textAlign: TextAlign.center,
          style: theme.textTheme.labelLarge?.copyWith(
            color: textColor ?? Colors.white,
            fontSize: fontSize ?? 16.sp,
            fontWeight: fontWeight ?? FontWeight.w700,
            height: 1.40,
            letterSpacing: 0.20,
          ),
        ),
      ),
    );
  }
}

