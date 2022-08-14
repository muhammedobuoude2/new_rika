// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../core/color_manger.dart';

class CustomTabBarScreenTwo extends StatefulWidget {
  final String title;
  final Color colorBack;
  final TextStyle? style;
  final Color? colorBorder;
  final Function? onTap;

  const CustomTabBarScreenTwo(
      {super.key,
      required this.title,
      required this.colorBack,
      this.style,
      this.colorBorder,
      this.onTap});
  @override
  State<CustomTabBarScreenTwo> createState() => _CustomTabBarScreenTwoState();
}

class _CustomTabBarScreenTwoState extends State<CustomTabBarScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        radius: 20,
        borderRadius: BorderRadius.circular(20),
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onTap: () => widget.onTap,
        child: Chip(
          label: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: widget.style ??
                Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Mont-SemiBold'),
          ),
          backgroundColor: widget.colorBack,
          side: BorderSide(color: widget.colorBorder ?? ColorManger.colorBlack),
        ));
  }
}
