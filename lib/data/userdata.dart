//create some sort of user class for effective state management
import 'package:flutter/material.dart';

class UserData {
  final String name;
  final String dept;
  final String level;
  UserData({required this.name, required this.dept, required this.level});
}

class UserDataProvider extends ChangeNotifier {
  UserData userData = UserData(name: 'Unique', dept: 'MCS', level: '100');
  UserData get userInfo => userData;

  void updateUserData(UserData newinfo) {
    userData = newinfo;
    notifyListeners();
  }
}
