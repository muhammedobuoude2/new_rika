// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
 import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsTwo extends StatefulWidget {
  const ProductDetailsTwo({Key? key}) : super(key: key);

  @override
  State<ProductDetailsTwo> createState() => _ProductDetailsTwoState();
}

class _ProductDetailsTwoState extends State<ProductDetailsTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Center(
          child: RatingBar.builder(
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) =>const  Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      )),
    );
  }
}
