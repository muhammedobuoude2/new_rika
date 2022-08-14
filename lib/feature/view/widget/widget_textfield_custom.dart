// ignore_for_file: file_names

import 'package:flutter/material.dart';
  
 
class MyWidget extends StatelessWidget {
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final String labelText;
  final TextInputType keyboardType;

  const MyWidget(
      {super.key,
      required this.enabledBorderColor,
      required this.focusedBorderColor,
      required this.labelText,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'Mont-BoldItalic.otf'),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
        ),
      ),
    );
  }
}
