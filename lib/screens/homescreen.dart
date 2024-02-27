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
//dummy variables
    var name = 'Unique';
    var dept = 'Mcs';
    var level = '100';
    var nocourse = '3';

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
                            padding: EdgeInsets.only(
                              left: screenHeight * 0.02,
                              top: screenHeight * 0.02,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Name: $name',
                                  style: lecturaTheme.textTheme.bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.1,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.05),
                                  child: Text(
                                    'Lvl:$level',
                                    style: lecturaTheme.textTheme.bodyMedium!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          //department
                          Padding(
                            padding: EdgeInsets.only(
                              left: screenHeight * 0.02,
                            ),
                            child: Text(
                              'Dept: $dept',
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
            SizedBox(
              height: screenHeight * 0.03,
            ),
            //the course banner
            Padding(
              padding: EdgeInsets.only(
                  right: screenWidth * 0.5, left: screenWidth * 0.03),
              child: Container(
                height: screenHeight * 0.05,
                width: screenWidth * 0.5,
                decoration: BoxDecoration(
                  color: lecturaTheme.cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Courses',
                    style: lecturaTheme.textTheme.bodyMedium!.copyWith(
                        color: Colors.white, fontSize: screenWidth * 0.05),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            //course backboard
            Container(
              height: screenHeight * 0.6,
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.03, right: screenWidth * 0.6),
              child: Text(
                'Num of courses: $nocourse',
                style: TextStyle(
                    fontSize: screenWidth * 0.03, color: Colors.black),
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
