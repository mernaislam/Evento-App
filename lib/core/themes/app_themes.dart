import 'package:evento_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

// to be completed
class AppThemes {
  static var lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      color: AppColors.olive,
    ),
  );
  static var darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.olive,
    appBarTheme: const AppBarTheme(
      color: AppColors.lightGreen,
    ),
  );
}
