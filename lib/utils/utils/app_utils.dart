import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtils {
  AppUtils._internal();
  static final AppUtils instance = AppUtils._internal();

  bool isValidateEmail({required String email}) {
    return GetUtils.isEmail(email);
  }

  bool isValidatePassword({required String password}) {
    if (password.length > 8 ||
        password.contains(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')) {
      return true;
    }
    return false;
  }

  String urlUserPlacholder =
      'https://sqlclinic.files.wordpress.com/2021/01/null.png';
  Widget imageNetwork(
      {double? width,
      double? height,
      String? url,
      BoxFit? fit,
      Clip clip = Clip.none,
      BoxShape shape = BoxShape.rectangle}) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) {
        return Container(
          clipBehavior: clip,
          decoration: BoxDecoration(
            shape: shape,
            image: DecorationImage(
              image: CachedNetworkImageProvider(url ?? urlUserPlacholder),
              fit: fit ?? BoxFit.cover,
            ),
          ),
        );
      },
      imageUrl: urlUserPlacholder,
      errorWidget: (context, url, error) {
        return CachedNetworkImage(
            imageUrl: urlUserPlacholder,
            errorWidget: (context, url, error) {
              return SizedBox(
                height: height,
                width: width,
                child: const Text("Error"),
              );
            },
            fit: BoxFit.contain);
      },
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, String? url) {
        return Container(
          clipBehavior: clip,
          decoration: BoxDecoration(
            shape: shape,
            image: const DecorationImage(
              image: AssetImage("assets/gifs/loading_shimmer.gif"),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                )),
          ),
        );
      },
    );
  }
}
