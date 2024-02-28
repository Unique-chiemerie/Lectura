import 'package:flutter/material.dart';
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
          children: [
            //little spacce before the icon
            SizedBox(
              height: screenHeight * 0.1,
            ),
            //the avatar
            SizedBox(
              height: screenHeight * 0.2,
              width: screenWidth * 0.3,
              child: const Placeholder(),
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
            SizedBox(
              height: screenHeight * 0.2,
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
            SizedBox(
              height: screenHeight * 0.2,
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
