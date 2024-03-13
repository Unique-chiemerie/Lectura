import 'package:flutter/material.dart';
import 'package:lecture_app/splashscreen/lectura_splashscreen.dart';
import 'package:lecture_app/theme/lectura_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //initialising hive
  await Hive.initFlutter();
  //create some custom hive box
  // ignore: unused_local_variable
  var userinfo = await Hive.openBox('biodata');
  // ignore: unused_local_variable
  var course = await Hive.openBox('course');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lecturaTheme,
      title: 'Lectura',
      home: const Lecturasplash(),
    ),
  );
}
