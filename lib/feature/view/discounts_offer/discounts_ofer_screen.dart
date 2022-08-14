import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rika_store/feature/model/dicount_model.dart';

import '../../core/color_manger.dart';
import '../widget/widget_button_custom.dart';
import 'data_widet_custom.dart';

class DiscountsOferScreen extends StatefulWidget {
  const DiscountsOferScreen({Key? key}) : super(key: key);

  @override
  State<DiscountsOferScreen> createState() => _DiscountsOferScreenState();
}

class _DiscountsOferScreenState extends State<DiscountsOferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
                shrinkWrap: true,
                primary: true,
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 45, horizontal: 25),
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
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          Text(
            'Discounts Offer',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Colors.black,
                  fontFamily: 'Mont-Bold',
                  fontSize: 18,
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder<QuerySnapshot>(
            // inside the <> you enter the type of your stream
            stream: FirebaseFirestore.instance
                .collection('discountProduct')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                return ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Stack(children: [
                      SizedBox(
                        width: double.infinity,
                        height: 160,
                        child: InkWell(
                          child: Image.network(
                            snapshot.data!.docs[index].get('imagePath'),
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.docs[index].get('titleDicount'),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'Mont-Bold'),
                            ),
                            Text(snapshot.data!.docs[index].get('bodyTitle'),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    ?.copyWith(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: 'Mont-Bold')),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                'With code: ${snapshot.data!.docs[index].get('code')} ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    ?.copyWith(
                                        fontSize: 11,
                                        color: ColorManger.colorBlack2,
                                        fontFamily: 'Mont-Bold'))
                          ],
                        ),
                      ),
                      Positioned(
                          left: 20,
                          bottom: 20,
                          child: SizedBox(
                            width: 80,
                            height: 30,
                            child: WidgetButtonCustom(
                              onTap: () {},
                              textBody: (AppData.instance
                                  .dataWidgetDiscount[index].titleButton),
                              colorsBorderSide: ColorManger.colorBlack,
                              backgroundColor: ColorManger.colorBlack,
                              style: const TextStyle(
                                  fontSize: 12, fontFamily: 'Mont-Bold'),
                            ),
                          ))
                    ]);
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
        ])));
  }
}
