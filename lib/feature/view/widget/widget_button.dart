import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      this.color,
      required this.text,
      required this.iconPath,
      required this.onTap,
      required this.colorBorder,
      required this.colorBackAround,
      required this.textColor})
      : super(key: key);

  final Color? color;
  final String text;
  final String iconPath;
  final Function onTap;
  final Color colorBorder;
  final Color colorBackAround;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          style: ButtonStyle(
            fixedSize:
                MaterialStateProperty.all(const Size(double.infinity, 20)),
            backgroundColor: MaterialStateProperty.all(colorBackAround),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: BorderSide(width: 2, color: colorBorder)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 18,
                height: 18,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(text,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        fontFamily: 'Mont-BoldItalic.otf',
                      )),
            ],
          )),
    );
  }
}
