import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Style {
  Color primaryColor = Colors.white;
  Color secondaryColor = Colors.amber;
  Color accentColor = Colors.blue;
  Color emphasisColor = Colors.blue;
  Color backGroundColor = Colors.black;
  Color foreGroundColor = Colors.white10;
  Color fontColor = Colors.grey;
  Color errorColor = Colors.red;
  Color warningColor = Colors.yellow;

  TextStyle titleFontStyle = const TextStyle();
  TextStyle subtitleFontStyle = const TextStyle();

  BorderRadius borderRadius = BorderRadius.circular(16);
}

class LightStyle extends Style {
  @override
  Color get primaryColor => Color(0xffE0E4DD);

  @override
  Color get secondaryColor => Color(0xff94A187);

  @override
  Color get accentColor => Color(0xffaed6bd);

  @override
  Color get emphasisColor => Color(0xfffb9274);

  @override
  Color get backGroundColor => Color(0xffeff4fb);

  @override
  Color get foreGroundColor => Colors.white;
  @override
  Color get fontColor => Color(0xff0A0A0B);

  @override
  TextStyle get titleFontStyle => GoogleFonts.inter(
        color: fontColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );

  @override
  TextStyle get subtitleFontStyle => GoogleFonts.lato(
        color: fontColor.withOpacity(0.3),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  @override
  BorderRadius get borderRadius => super.borderRadius;
}

class DarkStyle extends Style {
  @override
  Color get primaryColor => Color.fromARGB(255, 247, 247, 242);

  @override
  Color get emphasisColor => Color(0xff1B7EDA);

  @override
  Color get secondaryColor => Color(0xffF9CE4E);

  @override
  Color get backGroundColor => Color(0xff071F36);

  @override
  Color get foreGroundColor => Color(0xff0C345A);

  @override
  TextStyle get titleFontStyle => GoogleFonts.pacifico(
        fontStyle: FontStyle.italic,
        color: secondaryColor,
        fontSize: 48,
      );
}
