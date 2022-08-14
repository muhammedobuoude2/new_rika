// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
  
class Test_view extends StatefulWidget {
  const Test_view({Key? key}) : super(key: key);

  @override
  State<Test_view> createState() => _Test_viewState();
}

class _Test_viewState extends State<Test_view> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
