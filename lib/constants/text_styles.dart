import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/fonts.dart';

class TextStyles {
  TextStyles._();

  static TextStyle get logo => GoogleFonts.alexBrush(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: Colors.white,
      );

  static TextStyle get menuItem => const TextStyle(
        fontFamily: Fonts.inconsolata,
        fontSize: 16,
        color: Colors.white,
        letterSpacing: 1,
      );

  static TextStyle get heading => const TextStyle(
        color: Color(0xFF1e1e1e),
        fontFamily: Fonts.nexaBold,
      );

  static TextStyle get subHeading => const TextStyle(
        color: Colors.white,
        letterSpacing: 1.5,
        height: 1,
        fontFamily: Fonts.product,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get company => TextStyle(
        fontFamily: Fonts.inconsolata,
        color: Colors.grey[300],
        height: 1.5,
        fontSize: 24,
        letterSpacing: 1,
      );

  static TextStyle get madewith => TextStyle(
        fontFamily: Fonts.inconsolata,
        height: 1.5,
        color: Colors.grey[300],
        fontSize: 18,
        letterSpacing: 1.5,
      );

  static TextStyle get body => TextStyle(
        color: Colors.grey[400],
        fontFamily: Fonts.inconsolata,
        height: 1.5,
        letterSpacing: 1.5,
      );

  static TextStyle get body1 => const TextStyle(
        fontFamily: Fonts.product,
        color: Color(0xFF85819C),
        height: 1.5,
        fontSize: 10,
        letterSpacing: 1,
      );

  static TextStyle get chip => const TextStyle(
        fontFamily: Fonts.inconsolata,
        height: 1.5,
        fontSize: 12,
        letterSpacing: 1,
      );
}
