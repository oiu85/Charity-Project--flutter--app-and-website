import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

ThemeData appTheme(BuildContext context) {
  //* Get current locale to determine font
  final locale = context.locale;
  final fontFamily = locale.languageCode == 'ar' ? 'Tajawal' : 'BebasNeue';

  return ThemeData(
    useMaterial3: true, //* for using the material 3
    fontFamily: fontFamily, //* Font based on language (Tajawal for Arabic, BebasNeue for English)

    //*Basic Colors using AppColors
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.tertiary,
      surface: AppColors.surface,
      background: AppColors.background,
    ),

    //* Responsive Text Theme using ScreenUtil
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, fontFamily: fontFamily),
      displayMedium: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily),
      displaySmall: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500, fontFamily: fontFamily),
      headlineMedium: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily),
      headlineSmall: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, fontFamily: fontFamily),
      titleLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily),
      bodyLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, fontFamily: fontFamily),
      bodyMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: fontFamily),
      bodySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300, fontFamily: fontFamily),
      labelLarge: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily),
      titleSmall: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700, fontFamily: fontFamily),
      titleMedium: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily),
      labelSmall: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400, fontFamily: fontFamily),
    ).apply(fontSizeFactor: 1), //? Scale Factor for changing the all fonts sizes if need it

    //* Responsive Button Styles
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
      ),
    ),

    //* Responsive AppBar Style
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.surface,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.surface,
      ),
    ),

    //* Responsive Card Styles
    cardTheme: CardThemeData(
      color: AppColors.surface,
      shadowColor: AppColors.shadowLight,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    ),

    //* Basic input for the input decorations
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: AppColors.textFiledBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: AppColors.primary, width: 2.w),
      ),
      labelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
      ),
    ),
  );
}

