// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
 
import '../../../utils/utils/app_utils.dart';
import '../../core/color_manger.dart';
import '../../view_model/auth_view_model.dart';
import '../widget/widget_button_custom.dart';

class SinginScreen extends StatefulWidget {
  const SinginScreen({Key? key}) : super(key: key);

  @override
  State<SinginScreen> createState() => _SinginScreenState();
}

@override
class _SinginScreenState extends State<SinginScreen> {
  static final AuthViewModel authViewModel =
      Get.put(AuthViewModel(), permanent: true);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool valueCheckBox = false;
  bool isUserName = false;
  bool isEmail = false;
  bool _obscureText = true;
  bool _obscureTextTwo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 60, horizontal: 80),
                          child: Image.asset(
                            'assets/images/logoblack.png',
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sign Up',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      color: ColorManger.colorBlack,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 26,
                                      fontFamily: 'Mont-BoldItalic.otf'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Create an new account',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                      color: ColorManger.colorBlack2,
                                      fontSize: 18,
                                      fontFamily: 'Mont-BoldItalic.otf'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: authViewModel.tecName,
                              validator: (e) {
                                if (e!.isEmpty) {
                                  return 'Please enter a valid name';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: ('User Name'),
                                labelStyle: TextStyle(
                                    color: ColorManger.colorBlack,
                                    fontSize: 24,
                                    fontFamily: 'Mont-BoldItalic.otf'),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFEEEEEE)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorManger.colorBlack),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: authViewModel.tecEmail,
                              validator: (email) {
                                if (!AppUtils.instance
                                    .isValidateEmail(email: email.toString())) {
                                  return 'Retype the email';
                                }

                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: ('Email'),
                                labelStyle: TextStyle(
                                    color: ColorManger.colorBlack,
                                    fontSize: 24,
                                    fontFamily: 'Mont-BoldItalic.otf'),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFEEEEEE)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorManger.colorBlack),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (password) {
                                if (!AppUtils.instance.isValidatePassword(
                                    password: password.toString())) {
                                  return 'Please enter a password containing the \$ symbol or! or @';
                                }
                                return null;
                              },
                              controller: authViewModel.tecPassword,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _obscureText,
                              obscuringCharacter: '*',
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: _obscureText
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 12),
                                          child: Icon(
                                            Icons.visibility,
                                            color: Colors.black,
                                            size: 24,
                                          ))
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 12),
                                          child: SvgPicture.asset(
                                            'assets/svg/eye.svg',
                                          ),
                                        ),
                                ),
                                labelText: ('Password'),
                                labelStyle: TextStyle(
                                    color: ColorManger.colorBlack,
                                    fontSize: 24,
                                    fontFamily: 'Mont-BoldItalic.otf'),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFEEEEEE)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorManger.colorBlack),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (password) {
                                if (!AppUtils.instance.isValidatePassword(
                                    password: password.toString())) {
                                  return 'Please enter a password containing the \$ symbol or! or @';
                                }
                                return null;
                              },
                              controller: authViewModel.tecConfirmPassword,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _obscureTextTwo,
                              obscuringCharacter: '*',
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureTextTwo = !_obscureTextTwo;
                                    });
                                  },
                                  child: _obscureTextTwo
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 12),
                                          child: Icon(
                                            Icons.visibility,
                                            color: Colors.black,
                                          ))
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 12),
                                          child: SvgPicture.asset(
                                            'assets/svg/eye.svg',
                                          ),
                                        ),
                                ),
                                labelText: ('Confirm Password'),
                                labelStyle: TextStyle(
                                    color: ColorManger.colorBlack,
                                    fontSize: 24,
                                    fontFamily: 'Mont-BoldItalic.otf'),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFEEEEEE)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorManger.colorBlack),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Checkbox(
                                  side: const BorderSide(
                                      color: Color(0xffAAAAAA)),
                                  focusColor: ColorManger.colorBlack,
                                  hoverColor: ColorManger.colorBlack,
                                  activeColor: ColorManger.colorBlack,
                                  value: valueCheckBox,
                                  onChanged: (value) async {
                                    setState(() {
                                      valueCheckBox = value!;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    'By creating an account you have to agree\nwith our them & condication.',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        ?.copyWith(
                                            color: ColorManger.colorBlack3,
                                            fontSize: 14,
                                            fontFamily: 'Mont-BoldItalic.otf'),
                                  ),
                                ),
                                //Text
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ), //Row)
                            WidgetButtonCustom(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                } else if ((!valueCheckBox)) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          action: SnackBarAction(
                                            textColor: ColorManger.colorWhite,
                                            disabledTextColor:
                                                ColorManger.colorWhite,
                                            label: ('skip'),
                                            onPressed: () {
                                              // Code to execute.
                                            },
                                          ),
                                          content: Text(
                                            'you have to agree fsdfsfsdf',
                                            style: TextStyle(fontSize: 13),
                                          )));
                                } else if (authViewModel.tecPassword.text !=
                                    authViewModel.tecConfirmPassword.text) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          action: SnackBarAction(
                                            textColor: ColorManger.colorWhite,
                                            disabledTextColor:
                                                ColorManger.colorWhite,
                                            label: ('skip'),
                                            onPressed: () {
                                              // Code to execute.
                                            },
                                          ),
                                          content: Text(
                                            'The password is not the same',
                                            style: TextStyle(fontSize: 13),
                                          )));
                                  //snack
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          action: SnackBarAction(
                                            textColor: ColorManger.colorWhite,
                                            disabledTextColor:
                                                ColorManger.colorWhite,
                                            label: ('skip'),
                                            onPressed: () {
                                              // Code to execute.
                                            },
                                          ),
                                          content: Text(
                                            'Please check the data entered',
                                            style: TextStyle(fontSize: 13),
                                          )));
                                }
                              },
                              textBody: 'Sing Up',
                              colorsBorderSide: ColorManger.colorBlack,
                              backgroundColor: ColorManger.colorBlack,
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      )
                    ]))));
  }
}
