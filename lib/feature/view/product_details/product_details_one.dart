import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rika_store/feature/core/color_manger.dart';
import 'package:rika_store/feature/model/product_model.dart';
import 'package:rika_store/feature/view/splash_screen/onboarding_screen.dart';
import 'package:rika_store/feature/view/widget/widget_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsOne extends StatefulWidget {
  const ProductDetailsOne({required this.productModel, Key? key})
      : super(key: key);
  final ProductModel productModel;

  @override
  State<ProductDetailsOne> createState() => _ProductDetailsOneState();
}

class _ProductDetailsOneState extends State<ProductDetailsOne> {
  var boardController = PageController();

  int num = 1;
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
                width: 375,
                height: 700,
                child: CachedNetworkImage(
                  
                    fit: BoxFit.cover,
                    imageUrl: widget.productModel.image ?? '')),
          ),
          Positioned(
            top: 44,
            left: 25,
            right: 25,
            child: Row(
              children: [
                InkWell(
                  child: SvgPicture.asset(
                    'assets/svg/back_flat.svg',
                    width: 35,
                    height: 35,
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                const Spacer(),
                InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/svg/cart.svg',
                      width: 30,
                      height: 30,
                    )),
              ],
            ),
          ),
          Positioned(
            left: 320,
            right: 25,
            top: 340,
            child: InkWell(
              child: SvgPicture.asset('assets/svg/love.svg'),
            ),
          ),
          Positioned(
            left: 163,
            right: 160,
            top: 360,
            child: Container(
              width: 050,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ]),
            ),
          ),
          Positioned(
            bottom: -10,
            left: 0,
            right: 0,
            child: Stack(children: [
              Container(
                height: 450,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Positioned(
                  bottom: 75,
                  right: 50,
                  left: 25,
                  child: Text(
                    'Total Price',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: ColorManger.colorBlack,
                        fontFamily: 'Mont-Regular',
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
                  )),
              Positioned(
                  bottom: 55,
                  right: 50,
                  left: 25,
                  child: Text(
                    widget.productModel.price ?? '',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: ColorManger.colorBlack,
                        fontFamily: 'Mont-Bold',
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
              Positioned(
                  bottom: 50,
                  right: 25,
                  left: 150,
                  child: Button(
                      text: 'Add to cart',
                      iconPath: 'assets/svg/Addtocart.svg',
                      onTap: () {},
                      colorBorder: ColorManger.colorBlack,
                      colorBackAround: ColorManger.colorBlack,
                      textColor: ColorManger.colorWhite)),
              Positioned(
                bottom: 375,
                right: 50,
                left: 25,
                child: RichText(
                  text: TextSpan(
                    text: widget.productModel.name ?? '',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: ColorManger.colorBlack,
                        fontFamily: 'Mont-SemiBold',
                        fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n ${widget.productModel.bodytitle}',
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                            color: ColorManger.colorBlack.withOpacity(0.5),
                            height: 2,
                            fontFamily: 'Mont-Regular',
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 30,
                top: 35,
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorManger.colorBlack4,
                      borderRadius: BorderRadius.circular(20)),
                  width: 90,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          child: Text(
                        '-',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(fontSize: 18),
                      )),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '$num',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          '+',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: 30,
                  top: 90,
                  child: Text(
                    'Avaliable in stok',
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: 14,
                          fontFamily: 'Mont-SemiBold',
                        ),
                    textAlign: TextAlign.start,
                  ))
            ]),
          ),
          Positioned(
              left: 25,
              right: 0,
              top: 498,
              child: SizedBox(
                width: 80,
                height: 50,
                child: RatingBar.builder(
                  glowColor: ColorManger.colorBlack4,
                  itemSize: 15,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    // print(rating);
                  },
                ),
              )),
          Positioned(
            left: 110,
            right: 0,
            top: 500,
            child: Text(
              '(320 Review)',
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontSize: 12,
                    fontFamily: 'Mont-SemiBold',
                  ),
            ),
          ),
          Positioned(
              left: 25,
              right: 90,
              bottom: 220,
              child: SizedBox(
                  width: 265,
                  height: 75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Size',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              fontSize: 18,
                              fontFamily: 'Mont-SemiBold',
                            ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 260,
                          height: 40,
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: [
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color: ColorManger.colorBlack5),
                                    borderRadius: BorderRadius.circular(20),
                                    color: ColorManger.transparentColor,
                                  ),
                                  width: 40,
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      'S',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          ?.copyWith(
                                            fontSize: 14,
                                            color: ColorManger.colorBlack6,
                                            fontFamily: 'Mont-SemiBold',
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color: ColorManger.colorBlack5
                                            .withOpacity(0.8)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: ColorManger.transparentColor,
                                  ),
                                  width: 40,
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      'M',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          ?.copyWith(
                                            fontSize: 14,
                                            color: ColorManger.colorBlack6
                                                .withOpacity(0.8),
                                            fontFamily: 'Mont-SemiBold',
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color: ColorManger.colorBlack5
                                            .withOpacity(0.8)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: ColorManger.transparentColor,
                                  ),
                                  width: 40,
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      'L',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          ?.copyWith(
                                            fontSize: 14,
                                            color: ColorManger.colorBlack6
                                                .withOpacity(0.8),
                                            fontFamily: 'Mont-SemiBold',
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color: ColorManger.colorBlack5
                                            .withOpacity(0.8)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: ColorManger.transparentColor,
                                  ),
                                  width: 40,
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      'XL',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          ?.copyWith(
                                            fontSize: 14,
                                            color: ColorManger.colorBlack6
                                                .withOpacity(0.8),
                                            fontFamily: 'Mont-SemiBold',
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color: ColorManger.colorBlack5
                                            .withOpacity(0.8)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: ColorManger.transparentColor,
                                  ),
                                  width: 40,
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      'XXL',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          ?.copyWith(
                                            fontSize: 14,
                                            color: ColorManger.colorBlack6
                                                .withOpacity(0.8),
                                            fontFamily: 'Mont-SemiBold',
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ))),
          Positioned(
              right: 25,
              bottom: 190,
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 135,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(width: 1, color: ColorManger.colorWhite),
                        boxShadow: [
                          BoxShadow(
                            color: ColorManger.colorBlack.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 0), // Shadow position
                          ),
                        ],
                        color: Colors.white),
                    child: Stack(children: [
                      Positioned(
                          left: 10,
                          right: 10,
                          top: 10,
                          child: Column(
                            children: [
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1,
                                        color: ColorManger.colorBlack8,
                                      )),
                                  width: 20,
                                  height: 20,
                                  child: const Center(
                                    child: Icon(
                                      Icons.check,
                                      size: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorManger.colorBlack,
                                    shape: BoxShape.circle,
                                  ),
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorManger.colorMonochromatic,
                                    shape: BoxShape.circle,
                                  ),
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorManger.colorOrange,
                                    shape: BoxShape.circle,
                                  ),
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ],
                          )),
                    ]),
                  ),
                ],
              )),
          Positioned(
              left: 25,
              right: 0,
              bottom: 110,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: 16,
                          fontFamily: 'Mont-SemiBold',
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 325,
                    height: 50,
                    child: Text(
                      widget.productModel.description ?? '',
                      maxLines: 3,
                      strutStyle: const StrutStyle(height: 1.3),
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontSize: 11,
                            fontFamily: 'Mont-Regular',
                          ),
                    ),
                  )
                ],
              )),
        ],
      )),
    );
  }
}
