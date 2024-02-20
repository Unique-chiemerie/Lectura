import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lecturaTheme = ThemeData(
  primaryColor: Colors.purpleAccent,
  useMaterial3: true,
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.lemon(
        color: Colors.purpleAccent, fontWeight: FontWeight.bold),
  ),
);
