// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PageTwoSecreen extends StatefulWidget {
  const PageTwoSecreen({Key? key}) : super(key: key);

  @override
  State<PageTwoSecreen> createState() => _PageTwoSecreenState();
}

class _PageTwoSecreenState extends State<PageTwoSecreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Page2'),
    ));
  }
}
