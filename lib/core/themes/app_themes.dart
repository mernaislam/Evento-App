import 'package:evento_app/core/themes/app_colors.dart';
import 'package:evento_app/core/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

// to be completed
class AppThemes {
  static var lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    secondaryHeaderColor: AppColors.primaryColor.withOpacity(0.1),
    textTheme: CustomTextTheme.lightTextTheme,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.lightBackground,
    ),
  );
  static var darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    secondaryHeaderColor: AppColors.primaryColor.withOpacity(0.1),
    textTheme: CustomTextTheme.darkTextTheme,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.darkBackground,
    ),
  );
}
