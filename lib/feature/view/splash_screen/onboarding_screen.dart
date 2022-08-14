// ignore_for_file: file_names

// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../auth_screen/loging_screen.dart';

class BoardingModel {
  final String? image;
  final String? title;
  final String? body;

  BoardingModel({required this.image, this.title, this.body});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> bording = [
    BoardingModel(
        image: 'assets/images/onboarding1.png',
        title: '20% Discount\nNew Arrival Product',
        body:
            'Publish up your selfies to make yourself\nmore beautiful with this app.'),
    BoardingModel(
        image: 'assets/images/onboarding2.png',
        title: 'Take Advantage\nOf The Offer Shopping',
        body:
            'Publish up your selfies to make yourself more beautiful with this app.'),
    BoardingModel(
        image: 'assets/images/onboarding3.png',
        title: 'All Types Offers\nWithin Your Reach',
        body:
            'Publish up your selfies to make yourself more beautiful with this app.')
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int index) {
                  if (index == bording.length - 1) {
                    // ignore: avoid_print
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    // ignore: avoid_print
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(bording[index], context),
                itemCount: bording.length,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            // ignore: prefer_const_literals_to_create_immutables
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    count: bording.length,
                    effect: const ExpandingDotsEffect(
                        dotColor: Color(0xffDDDDDD),
                        activeDotColor: Colors.black,
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 5,
                        expansionFactor: 4)),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      Get.to(() => const LogingScreen());
                    } else {
                      boardController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  backgroundColor: Colors.black,
                  elevation: 12,
                  tooltip: 'next',
                  child: SvgPicture.asset(
                    'assets/svg/next_flat_button.svg',
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}

Widget buildBoardingItem(BoardingModel model, context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 480,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            // ignore: unnecessary_string_interpolations
            '${model.image}',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // ignore: unnecessary_string_interpolations
              '${model.title}',
              style: Theme.of(context).textTheme.headline3?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Mont-BoldItalic.otf'),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 290,
              height: 45,
              child: Text(
                // ignore: unnecessary_string_interpolations
                '${model.body}',
                style: Theme.of(context).textTheme.headline3?.copyWith(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 16,
                    fontFamily: 'Mont-BoldItalic.otf'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
