import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rika_store/feature/view/order_details/orded_details_data.dart';
import 'package:rika_store/feature/view/widget/widget_button_custom.dart';

import '../../core/color_manger.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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
            ],
          ),
          const SizedBox(height: 30),
          Text('Delivery Address',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: ColorManger.colorBlack,
                    fontFamily: 'Mont-Bold',
                    fontSize: 18,
                  )),
          const SizedBox(
            height: 20,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorManger.colorWhite,
                boxShadow: [
                  BoxShadow(
                    color: ColorManger.colorBlack3,
                    blurRadius: 15,
                    offset: const Offset(4, 2),
                  ),
                ],
              ),
              width: 325,
              height: 225,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Street:',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Mont-Bold',
                            ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' 3512 Pearl Street',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    color: ColorManger.colorBlack2
                                        .withOpacity(0.6),
                                    fontFamily: 'Mont-Regular',
                                    fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'City: ',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Mont-Bold',
                            ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Sacramento',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    color: ColorManger.colorBlack2
                                        .withOpacity(0.6),
                                    fontFamily: 'Mont-Regular',
                                    fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'State/province/area: ',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Mont-Bold',
                            ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' California',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    color: ColorManger.colorBlack2
                                        .withOpacity(0.6),
                                    fontFamily: 'Mont-Regular',
                                    fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Phone number:',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Mont-Bold',
                            ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' 916-299-4041',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    color: ColorManger.colorBlack2
                                        .withOpacity(0.6),
                                    fontFamily: 'Mont-Regular',
                                    fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Zip code:',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Mont-Bold',
                            ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' 95814',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    color: ColorManger.colorBlack2,
                                    fontFamily: 'Mont-Regular',
                                    fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Country calling code:',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Mont-Bold',
                            ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' +1',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    color: ColorManger.colorBlack2
                                        .withOpacity(0.6),
                                    fontFamily: 'Mont-Regular',
                                    fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Country:',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Mont-Bold',
                            ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '  United States',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    color: ColorManger.colorBlack2
                                        .withOpacity(0.6),
                                    fontFamily: 'Mont-Regular',
                                    fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 28,
          ),
          Text(
            'Product Item',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: ColorManger.colorBlack,
                fontSize: 15,
                fontFamily: 'Mont-Bold'),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.separated(
            physics: const BouncingScrollPhysics(),
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: OrderDetailsData.length,
            itemBuilder: ((context, index) => Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorManger.colorWhite,
                      boxShadow: [
                        BoxShadow(
                          color: ColorManger.colorBlack3,
                          blurRadius: 15,
                          offset: const Offset(4, 2),
                        )
                      ]),
                  width: double.infinity,
                  height: 80,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(OrderDetailsData[index].path),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            OrderDetailsData[index].firstname,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color: ColorManger.colorBlack,
                                    fontSize: 13,
                                    fontFamily: 'Mont-SemiBold'),
                          ),
                          Text(
                            OrderDetailsData[index].secondname,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color: ColorManger.colorBlack2,
                                    fontSize: 9,
                                    fontFamily: 'Mont-Regular'),
                          ),
                          Text(
                            '\$ ${OrderDetailsData[index].price}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color: ColorManger.colorBlack,
                                    fontSize: 13,
                                    fontFamily: 'Mont-Bold'),
                          )
                        ],
                      )
                    ],
                  ),
                )),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            'Promo Code',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: ColorManger.colorBlack,
                fontSize: 16,
                fontFamily: 'Mont-Bold'),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: ColorManger.colorWhite,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: ColorManger.colorBlack3,
                    blurRadius: 15,
                    offset: const Offset(4, 2),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  SvgPicture.asset('assets/svg/PromoCode.svg'),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Promo Code',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: ColorManger.colorBlack,
                            fontSize: 13,
                            fontFamily: 'Mont-Bold'),
                      ),
                      Text(
                        '#rika2021',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: ColorManger.colorBlack2,
                            fontSize: 9,
                            fontFamily: 'Mont-Regular'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Price',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: ColorManger.colorBlack2,
                          fontSize: 9,
                          fontFamily: 'Mont-Regular',
                        ),
                  ),
                  Text('\$443.00',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: ColorManger.colorBlack,
                            fontSize: 18,
                            fontFamily: 'Mont-Bold',
                          ))
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 160,
                height: 50,
                child: WidgetButtonCustom(
                  onTap: () {},
                  textBody: 'Place Order',
                  colorsBorderSide: Colors.black,
                  backgroundColor: Colors.black,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: ColorManger.colorWhite,
                        fontSize: 16,
                        fontFamily: 'Mont-SemiBold',
                      ),
                ),
              ),
            ],
          ),
        ])));
  }
}
