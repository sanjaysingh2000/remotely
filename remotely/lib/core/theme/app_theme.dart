import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
    ),

    textTheme: GoogleFonts.outfitTextTheme().copyWith(
      titleLarge: GoogleFonts.outfit(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
      ),
    ),
  );
}


class AppTextStyles {
  static TextStyle heading = GoogleFonts.outfit(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subHeading = GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle body = GoogleFonts.inter(
    fontSize: 14,
  );

  static TextStyle caption = GoogleFonts.inter(
    fontSize: 12,
    color: Colors.grey,
  );
}