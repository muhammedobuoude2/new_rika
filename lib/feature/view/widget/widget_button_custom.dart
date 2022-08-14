import 'package:flutter/material.dart';

class WidgetButtonCustom extends StatefulWidget {
  const WidgetButtonCustom(
      {Key? key,
      this.color,
      required this.onTap,
      required this.textBody,
      required this.colorsBorderSide,
      required this.backgroundColor,
      this.style})
      : super(key: key);

  final Color? color;
  final Function onTap;
  final String textBody;
  final Color colorsBorderSide;
  final Color backgroundColor;
  final TextStyle? style;

  @override
  State<WidgetButtonCustom> createState() => _WidgetButtonCustomState();
}

class _WidgetButtonCustomState extends State<WidgetButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              widget.onTap();
            },
            style: ButtonStyle(
              fixedSize:
                  MaterialStateProperty.all(const Size(double.infinity, 20)),
              backgroundColor:
                  MaterialStateProperty.all(widget.backgroundColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(width: 2, color: widget.colorsBorderSide)),
              ),
            ),
            child: Center(
                child: Text(
              widget.textBody,
              style: widget.style ??
                  Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Mont-BoldItalic.otf',
                      ),
            ))));
  }
}
