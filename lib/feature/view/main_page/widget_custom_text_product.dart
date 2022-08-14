// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../core/color_manger.dart';

class WidgetCustomTextProduct extends StatefulWidget {
  final String imagepath;
  final String title;
  final String body;
  final String price;

  const WidgetCustomTextProduct(
      {super.key,
      required this.imagepath,
      required this.title,
      required this.body,
      required this.price});
  @override
  State<WidgetCustomTextProduct> createState() =>
      _WidgetCustomTextProductState();
}

class _WidgetCustomTextProductState extends State<WidgetCustomTextProduct> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              width: 160,
              height: 180,
              child: Image.network(
                widget.imagepath,
                fit: BoxFit.fill,
                width: 160,
                height: 170,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  color: ColorManger.colorBlack,
                  fontSize: 14,
                  fontFamily: 'Mont-SemiBold',
                ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            widget.body,
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: ColorManger.colorBlack2,
                  fontSize: 12,
                  fontFamily: 'Mont-Regular',
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "\$ ${widget.price} ",
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: ColorManger.colorBlack,
                  fontSize: 14,
                  fontFamily: 'Mont-SemiBold',
                ),
          )
        ],
      ),
    );
  }
}
