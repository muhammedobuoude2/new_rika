// ignore_for_file: unused_label, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';

class DicountModel {
  String? id;
  String? imagePath;
  String? title;
  String? bodyTitle;
  String? code;
  String? titleButton;
  DicountModel(
      {this.bodyTitle,
      this.code,
      this.imagePath,
      this.title,
      this.titleButton});

  factory DicountModel.fromJson(Map<String, dynamic> data) {
    final imagePath = data['imagePath'] as String?;
    final title = data["title"] as String?;
    final bodyTitle = data["bodyTitle"] as String?;
    final code = data["code"] as String?;
    final titleButton = data["titleButton"] as String?;
    final id = data["id"] as String;
    return DicountModel(
      titleButton: titleButton,
      bodyTitle: bodyTitle,
      code: code,
      title: title,
      imagePath: imagePath,
    );
  }

  DicountModel.fromQuerySnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    id = snapshot.id;
    titleButton = snapshot.data()?["titleButton"];
    bodyTitle = snapshot.data()?["bodyTitle"];
    code = snapshot.data()?["code"];
    title = snapshot.data()?["title"];
    imagePath = snapshot.data()?["imagePath"];
  }
}
