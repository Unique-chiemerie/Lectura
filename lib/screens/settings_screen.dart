import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lecture_app/data/userdata.dart';
import 'package:lecture_app/theme/lectura_theme.dart';
import 'package:provider/provider.dart';

class Settingscreen extends StatefulWidget {
  const Settingscreen({super.key});

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {
  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataProvider>(context);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var userinfo = Hive.box('biodata');
    TextEditingController namecontroller = TextEditingController();
    TextEditingController departmentroller = TextEditingController();
    TextEditingController leveleditingcontroller = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_left_rounded,
              color: lecturaTheme.cardColor,
            ),
            iconSize: screenWidth * 0.1,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
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
                    controller: namecontroller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        labelText: 'Enter your name',
                        labelStyle: lecturaTheme.textTheme.bodyMedium!.copyWith(
                            color: const Color.fromARGB(255, 255, 251, 251)),
                        filled: true,
                        fillColor: lecturaTheme.cardColor),
                    maxLength: 6,
                  ),
                ),
              ),
              //Enter your department
              Center(
                child: SizedBox(
                  height: screenHeight * 0.15,
                  width: screenWidth * 0.8,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: departmentroller,
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
                    maxLength: 3,
                  ),
                ),
              ),

              //Enter your Level
              Center(
                child: SizedBox(
                  height: screenHeight * 0.15,
                  width: screenWidth * 0.8,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    controller: leveleditingcontroller,
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
                    maxLength: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (namecontroller.text.isNotEmpty ||
                departmentroller.text.isNotEmpty ||
                leveleditingcontroller.text.isNotEmpty) {
              userDataProvider.updateUserData(UserData(
                  name: namecontroller.text,
                  dept: departmentroller.text,
                  level: leveleditingcontroller.text));
              Navigator.pop(context);
              setState(() {
                userinfo.put(0, namecontroller.text);
                userinfo.put(
                  1,
                  departmentroller.text,
                );
                userinfo.put(2, leveleditingcontroller.text);
              });
            }
          },
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: SvgPicture.asset('assets/Vector.svg'),
        ),
      ),
    );
  }
}
