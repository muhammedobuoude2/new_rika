// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rika_store/feature/core/color_manger.dart';

class WidgetCategriosOne extends StatelessWidget {
  const WidgetCategriosOne(
      {Key? key,
      this.color,
      required this.onTap,
      required this.countCategorise,
      required this.colorsBorderSide,
      required this.backgroundColor,
      required this.nameCategorise,
      required this.pathIcon})
      : super(key: key);

  final Color? color;
  final Function onTap;
  final Color colorsBorderSide;
  final Color backgroundColor;
  final String nameCategorise;
  final int countCategorise;
  final String pathIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 70,
        child: ElevatedButton(
            onPressed: () {
              onTap();
            },
            style: ButtonStyle(
              fixedSize:
                  MaterialStateProperty.all(const Size(double.infinity, 20)),
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(width: 2, color: colorsBorderSide)),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Image.network(pathIcon),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(nameCategorise,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Mont-BoldItalic.otf',
                          )),
                  const Spacer(),
                  Text('$countCategorise Product',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 11,
                            color: ColorManger.colorWhite,
                            fontFamily: 'Mont-BoldItalic.otf',
                          ))
                ],
              ),
            )));
  }
}
