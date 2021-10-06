import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData(BuildContext context) {
  return Theme.of(context).copyWith(
    primaryColor: Colors.white,
    accentColor: Colors.black,
    textTheme: TextTheme(
      headline1: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize: 16.0,
      ),
      bodyText1: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize: 12.0,
      ),
    ),
  );
}
