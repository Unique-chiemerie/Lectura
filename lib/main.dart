import 'package:flutter/material.dart';
import 'package:lecture_app/splashscreen/lectura_splashscreen.dart';
import 'package:lecture_app/theme/lectura_theme.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lecturaTheme,
      title: 'Lectura',
      home: const Lecturasplash(),
    ),
  );
}
