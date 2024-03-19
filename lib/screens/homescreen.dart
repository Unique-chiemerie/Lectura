import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lecture_app/data/userdata.dart';
import 'package:lecture_app/screens/settings_screen.dart';
import 'package:lecture_app/theme/lectura_theme.dart';
import 'package:lecture_app/theme/sliding_route.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var userinfo = Hive.box('biodata');
  var courseBOX = Hive.box('course');
  final courselist = [];
  final TextEditingController _textcont = TextEditingController();
  List bookicons = [
    'assets/red_book.svg',
    'assets/green_book.svg',
    'assets/blue_Book.svg',
  ];

  void addCourse() {
    final course = _textcont.text;
    courselist.add(course);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final course = courseBOX.get(0);

    var nocourse = courselist.length;

    final userDataProvider = Provider.of<UserDataProvider>(context);
    final userdata = userDataProvider.userData;

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
                                  'Name: ${userdata.name}',
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
                                    'Lvl: ${userdata.level}',
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
                              'Dept: ${userdata.dept}',
                              style: lecturaTheme.textTheme.bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //the three dots
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        SlidingRoute(
                          page: const Settingscreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.1),
                      child: Icon(
                        Icons.more_horiz_rounded,
                        color: Colors.black,
                        size: screenWidth * 0.07,
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
              child: courseBOX.isEmpty
                  ? Center(
                      child: Text(
                        'No course added yet',
                        style: lecturaTheme.textTheme.bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                    )
                  : ListView.builder(
                      itemCount: courselist.length,
                      itemBuilder: (context, index) {
                        final bookIndex = Random().nextInt(3);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: lecturaTheme.cardColor,
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, blurRadius: 7),
                              ],
                            ),
                            child: ListTile(
                              title: Text(
                                course[index],
                                style: lecturaTheme.textTheme.bodyMedium!
                                    .copyWith(color: Colors.white),
                              ),
                              //the Trailing book icon that should be random

                              trailing: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  bookicons[bookIndex],
                                  height: screenHeight * 0.05,
                                  width: screenWidth * 0.05,
                                ),
                              ),
                              tileColor: lecturaTheme.cardColor,
                            ),
                          ),
                        );
                      },
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
                        controller: _textcont,
                        maxLength: 7,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.purple,
                        textCapitalization: TextCapitalization.characters,
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
                      setState(() {
                        addCourse();
                      });
                      _textcont.clear();
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
