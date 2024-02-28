import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lecture_app/screens/settings_screen.dart';
import 'package:lecture_app/theme/lectura_theme.dart';
import 'package:lecture_app/theme/sliding_route.dart';

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
                                  width: screenWidth * 0.05,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: screenWidth * 0.05),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          SlidingRoute(
                            page: const Settingscreen(),
                          ),
                        );
                      },
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
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: const Text('Mcs'),
                    trailing: const Icon(Icons.work),
                    tileColor: lecturaTheme.cardColor,
                  ),
                ),
              ),
            ),

            //space for the number of courses
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
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              builder: (context) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
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
                            labelText: 'Enter course name',
                            labelStyle: lecturaTheme.textTheme.bodyMedium!
                                .copyWith(
                                    color: const Color.fromARGB(
                                        255, 255, 251, 251)),
                            filled: true,
                            fillColor: lecturaTheme.cardColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      'assets/Vector.svg',
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.2,
                    ),
                  ),
                ],
              ),
            );
          },
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
