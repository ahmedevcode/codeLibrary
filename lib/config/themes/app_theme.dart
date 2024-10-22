import 'package:codelibrary/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme() {
  return ThemeData.dark().copyWith(
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      color: AppColors.background,
      centerTitle: false,
      elevation: 0,
    ),
  );
}

// class ColorsManger {
//   static const Color white = Colors.white;
//   static const Color yellow = Colors.yellow;
// }
