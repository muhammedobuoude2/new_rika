import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rika_store/feature/view/bottom_navigatin_bar/page_four_secreen.dart';
import 'package:rika_store/feature/view/bottom_navigatin_bar/page_three_secreen.dart';
import 'package:rika_store/feature/view/bottom_navigatin_bar/page_two_secreen.dart';
import 'package:rika_store/feature/view/discounts_offer/discounts_ofer_screen.dart';
import 'package:rika_store/feature/view/product_categroy.dart/product_category_one_screen.dart';
import 'package:rika_store/feature/view/product_details/product_details_one.dart';
import '../../core/color_manger.dart';
import '../main_page/main_one_screen.dart';

class CustomBottonmavigationbar extends StatefulWidget {
  const CustomBottonmavigationbar({Key? key}) : super(key: key);

  @override
  State<CustomBottonmavigationbar> createState() =>
      _CustomBottonmavigationbarState();
}

class _CustomBottonmavigationbarState extends State<CustomBottonmavigationbar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
          width: double.infinity,
          height: 77,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Stack(children: [
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: index == currentIndex
                            ? displayWidth * .32
                            : displayWidth * .18,
                        alignment: Alignment.center,
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height:
                              index == currentIndex ? displayWidth * .12 : 0,
                          width: index == currentIndex ? displayWidth * .32 : 0,
                          decoration: BoxDecoration(
                            color: index == currentIndex
                                ? ColorManger.colorBlack4
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == currentIndex
                              ? displayWidth * .31
                              : displayWidth * .18,
                          alignment: Alignment.center,
                          child: Stack(children: [
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width: index == currentIndex
                                      ? displayWidth * .13
                                      : 0,
                                ),
                                AnimatedOpacity(
                                  opacity: index == currentIndex ? 1 : 0,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  child: Text(
                                      index == currentIndex
                                          ? listOfStrings[index]
                                          : '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.copyWith(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Mont-SemiBold')
                                      //  TextStyle(
                                      // colorBlack4
                                      //   fontSize: 15,
                                      // ),
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width: index == currentIndex
                                      ? displayWidth * .03
                                      : 20,
                                ),
                                Icon(
                                  listOfIcons[index],
                                  size: displayWidth * .076,
                                  color: index == currentIndex
                                      ? ColorManger.colorBlack
                                      : Colors.black.withOpacity(0.09),
                                ),
                              ],
                            )
                          ]))
                    ]))),
          )),
      body: IndexedStack(
        // ignore: sort_child_properties_last
        children: const [
          MainOneScreen(),
          MainOneScreen(),
          PageTwoSecreen(),
          PageFourSecreen()
        ],
        index: currentIndex,
      ),
    );
  }
}

List<IconData> listOfIcons = [
  Icons.home_rounded,
  Icons.shopping_cart,
  Icons.notifications,
  Icons.person_rounded,
];
List<String> listOfStrings = ['Home', 'Cart', 'Notifi', 'Profile'];
