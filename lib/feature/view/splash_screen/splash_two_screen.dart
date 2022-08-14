// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rika_store/feature/view/auth_screen/loging_screen.dart';
import 'package:rika_store/feature/view/main_page/main_one_screen.dart';
import 'package:rika_store/utils/shared/shared_preferences.dart';

import '../auth_screen/singin_screen.dart';
import 'onboarding_screen.dart';

class SplashTwoScreen extends StatefulWidget {
  SplashTwoScreen({Key? key}) : super(key: key);

  bool isRouted = false;

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashTwoScreen> {
  @override
  void initState() {
    super.initState();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    if (!widget.isRouted) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => SharedPref.instance.getLogeedIn()
                  ? const MainOneScreen()
                  : const OnBoardingScreen()));
    }
  }

  initScreen(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/image1.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 15,
            bottom: 450,
            right: 0,
            child: Image.asset(
              'assets/images/logo.png',
              width: 175,
              height: 200,
            ),
          ),
          Positioned(
            left: 20,
            bottom: 100,
            right: 20,
            child: ElevatedButton(
                onPressed: () {
                  widget.isRouted = true;
                  Get.to(() => const LogingScreen());
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                      const Size(double.infinity, double.infinity)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: const BorderSide(
                          width: .5, color: Color(0xffCFCFCF)))),
                ),
                child: Text('Login',
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'Mont-Bold'))),
          ),
          Positioned(
              left: 20,
              bottom: 40,
              right: 20,
              child: ElevatedButton(
                  onPressed: () {
                    widget.isRouted = true;
                    Get.to(() => SinginScreen());
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.white.withOpacity(0.1)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: const BorderSide(
                              width: 2, color: Color(0xffCFCFCF))),
                    ),
                  ),
                  child: Text('Sign Up',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Mont-Bold',
                          fontWeight: FontWeight.w400)))),
        ],
      ),
    );
  }
}
