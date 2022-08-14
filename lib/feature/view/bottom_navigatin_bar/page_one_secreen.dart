// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PageOneSecreen extends StatefulWidget {
  const PageOneSecreen({Key? key}) : super(key: key);

  @override
  State<PageOneSecreen> createState() => _PageOneSecreenState();
}

class _PageOneSecreenState extends State<PageOneSecreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Page1'),
    ));
  }
}
