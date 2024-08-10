import 'package:evento_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.urbanist(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 38,
    ),
    headlineMedium: GoogleFonts.urbanist(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 24,
    ),
    headlineSmall: GoogleFonts.urbanist(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    titleLarge: GoogleFonts.urbanist(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 21,
    ),
    titleMedium: GoogleFonts.urbanist(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ), 
    titleSmall: GoogleFonts.urbanist(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    
    bodyLarge: GoogleFonts.urbanist(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    
    bodyMedium: GoogleFonts.urbanist(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ),
    
    bodySmall: GoogleFonts.urbanist(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ), 

    labelLarge: GoogleFonts.urbanist(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    ),
    
    labelMedium: GoogleFonts.urbanist(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.normal,
      fontSize: 12,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.urbanist(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 38,
    ),
    headlineMedium: GoogleFonts.urbanist(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 24,
    ),
    headlineSmall: GoogleFonts.urbanist(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    titleLarge: GoogleFonts.urbanist(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 21,
    ),
    titleMedium: GoogleFonts.urbanist(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ), 
    titleSmall: GoogleFonts.urbanist(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    
    bodyLarge: GoogleFonts.urbanist(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    
    bodyMedium: GoogleFonts.urbanist(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ),
    
    bodySmall: GoogleFonts.urbanist(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ), 

    labelLarge: GoogleFonts.urbanist(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    ),
    
    labelMedium: GoogleFonts.urbanist(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.normal,
      fontSize: 12,
    ),
  );
}
