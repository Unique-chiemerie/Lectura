import 'package:flutter/material.dart';
import 'package:lecture_app/screens/homescreen.dart';

class Lecturasplash extends StatefulWidget {
  const Lecturasplash({super.key});

  @override
  State<Lecturasplash> createState() => _LecturasplashState();
}

class _LecturasplashState extends State<Lecturasplash> {
  var lecpacity = 0.0;
  var turapacity = 0.0;
  @override
  void initState() {
    super.initState();
    pacityTimer();
    skip();
  }

// function to push the new screen
  void skip() {
    Future.delayed(
      const Duration(
        seconds: 8,
      ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Homescreen(),
        ),
      ),
    );
  }

  //function to show the lectura text stylishly
  void pacityTimer() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          lecpacity = 1.0;
        });
      },
    );
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        setState(() {
          turapacity = 1.0;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        children: [
          Opacity(
            opacity: lecpacity,
            child: const Text(
              'Lec',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          Opacity(
            opacity: turapacity,
            child: const Text(
              'tura',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ],
      ),
    ));
  }
}
