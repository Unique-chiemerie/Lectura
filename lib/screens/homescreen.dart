import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //space away
            SizedBox(
              height: screenHeight * 0.03,
            ),
            //The biodata and user name
            SizedBox(
              height: screenHeight * 0.1,
              width: screenWidth,
              child: const Row(
                children: [
                  CircleAvatar(
                    child: Center(
                      child: Text('B'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: screenHeight * 0.1,
        width: screenWidth * 0.2,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {},
          elevation: 0,
          child: SvgPicture.asset(
            'assets/AddFAB.svg',
            width: screenWidth * 0.2,
          ),
        ),
      ),
    );
  }
}
