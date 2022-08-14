// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/color_manger.dart';
import '../discounts_offer/discounts_ofer_screen.dart';
import '../widget/widget_button_custom.dart';

class WidgetCustomSlider extends StatefulWidget {
  const WidgetCustomSlider(
      {super.key,
      required this.imagePath,
      required this.discountpercentage,
      required this.bodyTitle,
      required this.code,
      required this.titleButton});

  final String imagePath;
  final String discountpercentage;
  final String bodyTitle;
  final String code;
  final String titleButton;

  @override
  State<WidgetCustomSlider> createState() => _WidgetCustomSliderState();
}

class _WidgetCustomSliderState extends State<WidgetCustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: 260,
        height: 160,
        child: InkWell(
          onTap: () {
            Get.to(const DiscountsOferScreen());
          },
          child: Image.network(
            widget.imagePath,
            width: double.infinity,
            height: 150,
            fit: BoxFit.fill,
          ),
        ),
      ),
      Positioned(
        top: 20,
        left: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.discountpercentage,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Mont-Bold'),
            ),
            Text(widget.bodyTitle,
                style: Theme.of(context).textTheme.headline2?.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'Mont-Bold')),
            const SizedBox(
              height: 10,
            ),
            Text('With code: ${widget.code}',
                style: Theme.of(context).textTheme.headline2?.copyWith(
                    fontSize: 11,
                    color: ColorManger.colorBlack2,
                    fontFamily: 'Mont-Bold'))
          ],
        ),
      ),
      Positioned(
          left: 20,
          bottom: 20,
          child: SizedBox(
            width: 80,
            height: 30,
            child: WidgetButtonCustom(
              onTap: () {},
              textBody: (widget.titleButton),
              colorsBorderSide: ColorManger.colorBlack,
              backgroundColor: ColorManger.colorBlack,
              style: const TextStyle(fontSize: 12, fontFamily: 'Mont-Bold'),
            ),
          ))
    ]);
  }
}
