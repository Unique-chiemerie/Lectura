import 'package:flutter/material.dart';
import 'package:lecture_app/screens/homescreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lecture_app/theme/lectura_theme.dart';

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
      const Duration(seconds: 3),
      () {
        setState(() {
          turapacity = 1.0;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 700),
            opacity: lecpacity,
            //the  logo spawning opacitically
            child: SvgPicture.asset(
              'assets/lecutra_logo.svg',
              height: screenHeight * 0.15,
              width: screenWidth * 0.1,
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 900),
            opacity: turapacity,
            child: Text(
              'ectura',
              style: lecturaTheme.textTheme.bodyMedium!
                  .copyWith(fontSize: screenWidth * 0.07),
            ),
          ),
        ],
      ),
    ));
  }
}
