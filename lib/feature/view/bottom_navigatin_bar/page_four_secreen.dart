import 'package:flutter/material.dart';
  
class PageFourSecreen extends StatefulWidget {
  const PageFourSecreen({Key? key}) : super(key: key);

  @override
  State<PageFourSecreen> createState() => _PageFourSecreenState();
}

class _PageFourSecreenState extends State<PageFourSecreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Page4'),
    ));
  }
}
