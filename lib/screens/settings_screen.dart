import 'package:flutter/material.dart';

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
        ],
      )),
    );
  }
}
