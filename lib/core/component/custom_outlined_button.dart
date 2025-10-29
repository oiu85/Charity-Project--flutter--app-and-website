import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.borderColor,
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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height ?? 40.h,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2.w,
              color: borderColor ?? Colors.white,
            ),
            borderRadius: BorderRadius.circular(
              borderRadius ?? 20.r,
            ),
          ),
        ),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
        alignment: Alignment.center,
        child: Text(
          text.tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: fontSize ?? 16.sp,
            fontFamily: 'Tajawal',
            fontWeight: fontWeight ?? FontWeight.w700,
            height: 1.40,
            letterSpacing: 0.20,
          ),
        ),
      ),
    );
  }
}

