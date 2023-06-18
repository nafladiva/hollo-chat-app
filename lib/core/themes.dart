import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core.dart';

class Themes {
  static ThemeData get init {
    return ThemeData(
      primaryColor: MyColor.primary,
      appBarTheme: const AppBarTheme(color: MyColor.primary),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: MyColor.primary,
      ),
      textTheme: GoogleFonts.interTextTheme(),
    );
  }
}
