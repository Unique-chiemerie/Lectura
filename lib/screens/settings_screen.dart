import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lecture_app/theme/lectura_theme.dart';

class Settingscreen extends StatefulWidget {
  const Settingscreen({super.key});

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //little spacce before the icon
            SizedBox(
              height: screenHeight * 0.07,
            ),
            //the avatar
            SizedBox(
              height: screenHeight * 0.1,
              width: screenWidth * 0.3,
              child: CircleAvatar(
                maxRadius: screenWidth * 0.1,
                backgroundColor: lecturaTheme.cardColor,
                child: Center(
                  child: SvgPicture.asset('assets/Boy.svg'),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            //enter your name
            Center(
              child: SizedBox(
                height: screenHeight * 0.15,
                width: screenWidth * 0.8,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'Enter your name ',
                      labelStyle: lecturaTheme.textTheme.bodyMedium!.copyWith(
                          color: const Color.fromARGB(255, 255, 251, 251)),
                      filled: true,
                      fillColor: lecturaTheme.cardColor),
                  maxLength: 5,
                ),
              ),
            ),
            //Enter your department
            Center(
              child: SizedBox(
                height: screenHeight * 0.15,
                width: screenWidth * 0.8,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'Enter your Dept..',
                      labelStyle: lecturaTheme.textTheme.bodyMedium!.copyWith(
                          color: const Color.fromARGB(255, 255, 251, 251)),
                      filled: true,
                      fillColor: lecturaTheme.cardColor),
                  maxLength: 5,
                ),
              ),
            ),

            //Enter your Level
            Center(
              child: SizedBox(
                height: screenHeight * 0.15,
                width: screenWidth * 0.8,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'Enter your Level',
                      labelStyle: lecturaTheme.textTheme.bodyMedium!.copyWith(
                          color: const Color.fromARGB(255, 255, 251, 251)),
                      filled: true,
                      fillColor: lecturaTheme.cardColor),
                  maxLength: 5,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }
}
