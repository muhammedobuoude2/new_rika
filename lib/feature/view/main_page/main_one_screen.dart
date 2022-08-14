// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rika_store/feature/model/product_model.dart';
import 'package:rika_store/feature/view/categories/categorie_one_screen.dart';
import 'package:rika_store/feature/view/main_page/widget_custom_slider.dart';
import 'package:rika_store/feature/view/product_details/product_details_one.dart';

import '../../core/color_manger.dart';
import 'widget_custom_text_product.dart';

class MainOneScreen extends StatefulWidget {
  const MainOneScreen({Key? key}) : super(key: key);

  @override
  State<MainOneScreen> createState() => _MainOneScreenState();
}

class _MainOneScreenState extends State<MainOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManger.colorWhite,
        body: SafeArea(
            child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(25),
                children: [
              Row(
                children: [
                  InkWell(
                    child: SvgPicture.asset(
                      'assets/svg/menu.svg',
                      width: 35,
                      height: 35,
                    ),
                    onTap: () {},
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/user.png',
                        width: 40,
                        height: 40,
                      )),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome,',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mont-Bold')),
                  Text('Our Rika Fashion App',
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 20,
                          fontFamily: 'Mont-Black')),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 280,
                        height: 50,
                        child: TextField(
                            decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 235, 235, 235),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: SvgPicture.asset(
                              'assets/svg/search.svg',
                              width: 10,
                              height: 20,
                            ),
                          ),
                          hintText: "Search...",
                          hintStyle:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    color: ColorManger.colorBlack3,
                                    fontSize: 16,
                                    fontFamily: 'Mont.otf',
                                  ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              width: 0.1,
                              color: Color.fromARGB(255, 210, 212, 212),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 241, 241, 241),
                              width: 0.1,
                            ),
                          ),
                        )),
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/svg/filtterIcon.svg',
                            width: 50,
                            height: 50,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 150,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('discountProduct')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: [
                                WidgetCustomSlider(
                                    imagePath:
                                        snapshot.data!.docs[1].get('imagePath'),
                                    discountpercentage: snapshot.data!.docs[1]
                                        .get('titleDicount'),
                                    bodyTitle:
                                        snapshot.data!.docs[1].get('bodyTitle'),
                                    code: snapshot.data!.docs[1].get('code'),
                                    titleButton: 'Get Now'),
                                const SizedBox(
                                  width: 20,
                                ),
                                WidgetCustomSlider(
                                    imagePath:
                                        snapshot.data!.docs[2].get('imagePath'),
                                    discountpercentage: snapshot.data!.docs[2]
                                        .get('titleDicount'),
                                    bodyTitle:
                                        snapshot.data!.docs[2].get('bodyTitle'),
                                    code: snapshot.data!.docs[2].get('code'),
                                    titleButton: 'Get Now'),
                              ],
                            );
                          }
                          if (snapshot.hasError) {
                            return const Text('Error');
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                child: Row(
                  children: [
                    Text(
                      'New Arrivals',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Mont-Bold'),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(const CategorieOneScreen());
                      },
                      child: Text(
                        'View All',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: 'Mont-Bold'),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // StreamBuilder<QuerySnapshot>(
              //     stream: FirebaseFirestore.instance
              //         .collection('products')
              //         .snapshots(),
              //     builder: (context, snapshot) {

              SizedBox(
                  height: 250,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('products')
                        .limit(2)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      if (snapshot.hasData) {
                        return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            ProductModel model = ProductModel.fromQuerySnapshot(
                                snapshot.data!.docs[index]
                                    as DocumentSnapshot<Map<String, dynamic>>);
                            return InkWell(
                              onTap: () => Get.to(
                                  () => ProductDetailsOne(productModel: model)),
                              child: WidgetCustomTextProduct(
                                title: model.name ?? '',
                                body: model.bodytitle ?? '',
                                imagepath: model.image ?? '',
                                price: model.price ?? '',
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 40,
                          ),
                          itemCount: snapshot.data!.docs.length,
                          // WidgetCustomTextProduct(
                          //   title: snapshot.data!.docs[0].get('name'),
                          //   body: snapshot.data!.docs[0].get('body'),
                          //   imagepath: snapshot.data!.docs[0].get('image'),
                          //   price: snapshot.data!.docs[0].get('price'),
                          // ),
                          // const SizedBox(
                          //   width: 40,
                          // ),
                          // WidgetCustomTextProduct(
                          //   title: snapshot.data!.docs[1].get('name'),
                          //   body: snapshot.data!.docs[1].get('body'),
                          //   imagepath: snapshot.data!.docs[1].get('image'),
                          //   price: snapshot.data!.docs[1].get('price'),
                          // )
                        );
                      }
                      if (snapshot.hasError) {
                        return const Text('Error');
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ))
            ])));
  }
}
