import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lecture_app/theme/lectura_theme.dart';

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //The circled avatar
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: CircleAvatar(
                      maxRadius: screenWidth * 0.1,
                      backgroundColor: lecturaTheme.cardColor,
                      child: Center(
                        child: SvgPicture.asset('assets/Boy.svg'),
                      ),
                    ),
                  ),
                  //The Biodata things
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: lecturaTheme.cardColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //name
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.05),
                            child: Text(
                              'Name:',
                              style: lecturaTheme.textTheme.bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          //department
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.05),
                            child: Text(
                              'Dept:',
                              style: lecturaTheme.textTheme.bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //the three dots
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.1),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_horiz_rounded,
                        color: Colors.black,
                        size: screenWidth * 0.05,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //the course banner
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
