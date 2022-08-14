import 'package:flutter/material.dart';

class PageThreeSecreen extends StatefulWidget {
  const PageThreeSecreen({Key? key}) : super(key: key);

  @override
  State<PageThreeSecreen> createState() => _PageThreeSecreenState();
}

class _PageThreeSecreenState extends State<PageThreeSecreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Page3'),
    ));
  }
}
