// ignore_for_file: unused_field, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:rika_store/feature/model/categroy_model.dart';
import 'package:rika_store/feature/view/bottom_navigatin_bar/custombottonmavigationbar.dart';
import 'package:rika_store/utils/shared/shared_preferences.dart';

import '../core/color_manger.dart';

class AuthViewModel extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  // final Firebase
  TextEditingController tecEmailLog = TextEditingController();
  TextEditingController tecPasswordLog = TextEditingController();

  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;

  String? categoryName;

  TextEditingController tecName = TextEditingController();
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPassword = TextEditingController();
  TextEditingController tecConfirmPassword = TextEditingController();

  GoogleSignInAccount? UserGoogle;
  GoogleSignInAccount? get user => UserGoogle;

  Future<void> login({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => const CustomBottonmavigationbar());
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        action: SnackBarAction(
          textColor: ColorManger.colorWhite,
          disabledTextColor: ColorManger.colorWhite,
          label: ('skip'),
          onPressed: () {
            // Code to execute.
          },
        ),
        content: Text(
          e.message ?? "",
          style: const TextStyle(fontSize: 13),
        ),
      ));
      Logger().e("Error $e");
    }
  }

  void getCategory({required String categoryId}) async {
    await FirebaseFirestore.instance
        .collection('categroy')
        .where(FieldPath.documentId, isEqualTo: categoryId)
        .get()
        .then((value) {
      CategoreyModel model = CategoreyModel.fromQuerySnapshot(value.docs.first);
      categoryName = model.name;
      update();
    });
  }

  Future<void> singup() async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: tecEmail.text, password: tecPassword.text)
          .then((credential) async {
        await credential.user?.updateDisplayName(tecName.text);
        Get.offAll(() => const CustomBottonmavigationbar());
      }).catchError((e) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          action: SnackBarAction(
            textColor: ColorManger.colorWhite,
            disabledTextColor: ColorManger.colorWhite,
            label: ('skip'),
            onPressed: () {
              // Code to execute.
            },
          ),
          content: Text(
            e.message ?? "",
            style: const TextStyle(fontSize: 13),
          ),
        ));
        Logger().e(e);
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        action: SnackBarAction(
          textColor: ColorManger.colorWhite,
          disabledTextColor: ColorManger.colorWhite,
          label: ('skip'),
          onPressed: () {
            // Code to execute.
          },
        ),
        content: Text(
          e.message ?? "",
          style: const TextStyle(fontSize: 13),
        ),
      ));
      Logger().e(e);
    }
  }

  loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;

      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential)
          .then(
              (value) => (Get.offAll(() => const CustomBottonmavigationbar())));
    } else {}
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    SharedPref.instance.setLogeedIn(loggedIn: true);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
