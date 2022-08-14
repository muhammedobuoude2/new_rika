import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rika_store/feature/core/color_manger.dart';
import 'package:rika_store/feature/model/categroy_model.dart';
import 'package:rika_store/feature/model/product_model.dart';
import 'package:rika_store/feature/view/main_page/widget_custom_text_product.dart';
import 'package:rika_store/feature/view/product_details/product_details_one.dart';
import 'package:rika_store/feature/view_model/auth_view_model.dart';

class ProductCategorOneScreen extends StatefulWidget {
  const ProductCategorOneScreen({required this.categoryId, Key? key})
      : super(key: key);

  final String categoryId;

  @override
  State<ProductCategorOneScreen> createState() =>
      _ProductCategorOneScreenState();
}

class _ProductCategorOneScreenState extends State<ProductCategorOneScreen> {
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
                        'assets/svg/search.svg',
                        width: 20,
                        height: 20,
                      )),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                child: Row(
                  children: [
                    GetBuilder<AuthViewModel>(builder: (mo) {
                      mo.getCategory(categoryId: widget.categoryId);
                      return Text(
                        mo.categoryName ?? '',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Mont-Bold'),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .where("categreyId", isEqualTo: widget.categoryId)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (snapshot.hasData) {
                      return GridView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: ((context, index) {
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
                        }),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 260,
                                childAspectRatio: 5 / 8,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 15),
                      );
                    }
                    return const SizedBox();
                  }),
            ])));
  }
}
