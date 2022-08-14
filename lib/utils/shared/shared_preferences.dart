// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref._();
  static SharedPref instance = SharedPref._();
  late SharedPreferences prefs;

  final String keyLoggedIn = 'logged_in';

  // static  _shared;

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> setLogeedIn({required bool loggedIn}) async {
    bool sucssess = await prefs.setBool(keyLoggedIn, loggedIn);
    debugPrint('sucssess : $sucssess');
  }

  bool getLogeedIn() {
    return prefs.getBool(keyLoggedIn) ?? false;
  }
  
}
