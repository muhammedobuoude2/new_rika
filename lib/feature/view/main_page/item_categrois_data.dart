// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/color_manger.dart';

class ItemLastCart extends StatelessWidget {
  const ItemLastCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        height: 120,
        width: double.infinity,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    child: Image.asset(
                  'assets/images/AxelArigato.png',
                  width: 80,
                  height: 80,
                )),
                const Spacer(),
                SizedBox(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Axel Arigato',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: ColorManger.colorBlack,
                                  fontFamily: 'Mont-Black',
                                  fontSize: 14),
                        ),
                        const SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'RHW Rosie 1 Sandals',
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(
                                  color:
                                      ColorManger.colorBlack.withOpacity(0.3),
                                  fontFamily: 'Mont-Black',
                                  fontSize: 11),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/svg/star.svg'),
                            const SizedBox(
                              width: 5,
                              height: 5,
                            ),
                            Text(
                              '( 4.5 )',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                      fontFamily: 'Mont-SemiBold',
                                      fontSize: 12),
                            )
                          ],
                        ),
                        const Spacer(),
                      ]),
                ),
                const Spacer(),
                SizedBox(
                  width: 60,
                  height: 30,
                  child: InkWell(
                    onTap: () {
                
                    },
                    child: Text(
                      '\$270.00',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: ColorManger.colorBlack,
                          fontFamily: 'Mont-Black',
                          fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
