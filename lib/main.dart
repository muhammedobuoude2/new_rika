// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rika_store/utils/shared/shared_preferences.dart';

import 'feature/view/splash_screen/splash_one_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPref.instance.initPrefs();
  await Firebase.initializeApp();

  runApp(GetMaterialApp(
    home: SplashOneScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Mont',
      sliderTheme: SliderThemeData(),
      tabBarTheme: TabBarTheme(),
      navigationBarTheme: NavigationBarThemeData(),
      // inputDecorationTheme:
    ),
  ));
// AppBar(
//   systemOverlayStyle: SystemUiOverlayStyle(
//     // Status bar color
//     statusBarColor: Colors.red,

//     // Status bar brightness (optional)
//     statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
//     statusBarBrightness: Brightness.light, // For iOS (dark icons)
//   ),
// )
}
