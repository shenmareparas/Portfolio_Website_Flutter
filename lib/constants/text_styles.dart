import 'package:flutter/material.dart';
import 'package:portfolio/constants/fonts.dart';

class TextStyles {
  TextStyles._();

  static TextStyle get logo => const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
        fontFamily: Fonts.aquateScript,
        color: Colors.white,
      );

  static TextStyle get menuItem => const TextStyle(
        fontFamily: Fonts.inconsolata,
        fontSize: 16.0,
        color: Colors.white,
        letterSpacing: 1.0,
      );

  static TextStyle get heading => const TextStyle(
        color: Color(0xFF1e1e1e),
        fontFamily: Fonts.nexaBold,
      );

  static TextStyle get subHeading => const TextStyle(
        color: Colors.white,
        letterSpacing: 1.5,
        height: 1.0,
        fontFamily: Fonts.product,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get company => TextStyle(
        fontFamily: Fonts.inconsolata,
        color: Colors.grey[300],
        height: 1.5,
        fontSize: 24.0,
        letterSpacing: 1.0,
      );

  static TextStyle get strikeThrough => TextStyle(
        fontFamily: Fonts.inconsolata,
        height: 1.5,
        color: Colors.grey[300],
        fontSize: 18.0,
        decoration: TextDecoration.lineThrough,
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
        fontSize: 10.0,
        letterSpacing: 1.0,
      );

  static TextStyle get chip => const TextStyle(
        fontFamily: Fonts.inconsolata,
        height: 1.5,
        fontSize: 12.0,
        letterSpacing: 1.0,
      );
}
