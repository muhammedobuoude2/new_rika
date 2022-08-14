import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rika_store/feature/model/categroy_model.dart';
import 'package:rika_store/feature/view/product_categroy.dart/product_category_one_screen.dart';
import '../../core/color_manger.dart';
import 'widget_categrios_one.dart';

class CategorieOneScreen extends StatefulWidget {
  const CategorieOneScreen({Key? key}) : super(key: key);

  @override
  State<CategorieOneScreen> createState() => _CategorieOneScreenState();
}

class _CategorieOneScreenState extends State<CategorieOneScreen> {
  get boardController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.colorWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 44,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 1,
                  ),
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
                  Expanded(
                    child: InkWell(
                        child: Image.asset(
                          'assets/images/networkIcon.jpg',
                          width: 35,
                          height: 35,
                        ),
                        onTap: () {}),
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/svg/search.svg',
                        width: 20,
                        height: 20,
                      )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Categories',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontSize: 24,
                    fontFamily: 'Mont-Bold.otf',
                    fontWeight: FontWeight.bold),
              ),
              // ignore: prefer_const_literals_to_create_immutables
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  // inside the <> you enter the type of your stream
                  stream: FirebaseFirestore.instance
                      .collection('categroy')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          CategoreyModel model =
                              CategoreyModel.fromQuerySnapshot(snapshot
                                      .data!.docs[index]
                                  as DocumentSnapshot<Map<String, dynamic>>);
                          return WidgetCategriosOne(
                            onTap: () {
                              Get.to(() => ProductCategorOneScreen(
                                  categoryId: model.id!));
                            },
                            colorsBorderSide: ColorManger.colorBlack,
                            backgroundColor: ColorManger.colorBlack,
                            countCategorise: snapshot.data!.docs.length,
                            nameCategorise: model.name ?? '',
                            pathIcon: model.image ?? '',
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 15,
                          );
                        },
                      );
                    }
                    if (snapshot.hasError) {
                      return const Text('Error');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
