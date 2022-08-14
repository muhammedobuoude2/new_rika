// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

 import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rika_store/feature/view/auth_screen/singin_screen.dart';
import 'package:rika_store/feature/view_model/auth_view_model.dart';
import 'package:rika_store/utils/utils/app_utils.dart';

import '../../core/color_manger.dart';
import '../bottom_navigatin_bar/custombottonmavigationbar.dart';
 import '../widget/widget_button.dart';
import '../widget/widget_button_custom.dart';

class LogingScreen extends StatefulWidget {
  const LogingScreen({Key? key}) : super(key: key);

  @override
  State<LogingScreen> createState() => _LogingScreenState();
}

class _LogingScreenState extends State<LogingScreen> {
  bool isEmail = false;
  bool isPasword = false;

  static final AuthViewModel authViewModel =
      Get.put(AuthViewModel(), permanent: true);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 80),
                child: Image.asset(
                  'assets/images/logoblack.png',
                  width: double.infinity,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome!',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      fontFamily: 'Mont-Bold.otf'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'please login or sign up to continue our app',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 16,
                      fontFamily: 'Mont-BoldItalic.otf'),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: authViewModel.tecEmailLog,
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (!AppUtils.instance
                          .isValidateEmail(email: email.toString())) {
                        return 'Retype the email';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: isEmail
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              child: SvgPicture.asset(
                                'assets/svg/check_mark.svg',
                              ),
                            )
                          : Icon(
                              Icons.abc,
                              color: ColorManger.transparentColor,
                            ),
                      labelText: ('Email'),
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Mont-BoldItalic.otf'),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFEEEEEE)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    validator: (password) {
                      if (!AppUtils.instance
                          .isValidatePassword(password: password.toString())) {
                        return 'Retype the password';
                      }

                      return null;
                    },
                    controller: authViewModel.tecPasswordLog,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      suffixIcon: isPasword
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              child: SvgPicture.asset(
                                'assets/svg/check_mark.svg',
                              ),
                            )
                          : Icon(
                              Icons.abc,
                              color: ColorManger.transparentColor,
                            ),
                      labelText: ('Password'),
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Mont-BoldItalic.otf'),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFEEEEEE)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorManger.color),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Get.to(() => SinginScreen());
                },
                child: Text(
                  ' Don\'t have an account? Register an account Now',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontSize: 12,
                      fontFamily: 'Mont-Bold.otf',
                      color: ColorManger.colorFaceBook),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            WidgetButtonCustom(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  authViewModel.login(
                      email: authViewModel.tecEmailLog.text,
                      password: authViewModel.tecPasswordLog.text);
                }

                // SharedPref.instance.setLogeedIn(loggedIn: true);
                // Get.to(() => Test_view());
              },
              textBody: 'Login',
              colorsBorderSide: ColorManger.colorBlack,
              backgroundColor: ColorManger.colorBlack,
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child:
                      Divider(height: 1.0, thickness: 0.5, color: Colors.grey),
                ),
                Text(
                  ' or ',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.black, fontSize: 16, height: -0.2),
                ),
                Expanded(
                  child: Divider(
                    height: 1.0,
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              text: 'Continue with Facebook',
              iconPath: 'assets/svg/facebookloge.svg',
              onTap: () {
                authViewModel.loginWithFacebook();
              },
              colorBorder: ColorManger.colorFaceBook,
              colorBackAround: ColorManger.colorFaceBook,
              textColor: ColorManger.colorWhite,
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              text: 'Continue with Google',
              iconPath: 'assets/svg/googleicon.svg',
              onTap: () async {
                await authViewModel.signInWithGoogle().then((value) =>
                    {Get.offAll(() => const CustomBottonmavigationbar())});
              },
              colorBorder: ColorManger.color,
              colorBackAround: ColorManger.colorWhite,
              textColor: ColorManger.color.withOpacity(0.4),
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              text: 'Continue with Apple',
              iconPath: 'assets/svg/appelicon.svg',
              textColor: ColorManger.color.withOpacity(0.4),
              onTap: () {},
              colorBorder: ColorManger.color,
              colorBackAround: ColorManger.colorWhite,
            ),
          ]),
        ),
      ),
    );
  }
}
