// ignore_for_file: unused_label

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoreyModel {
  String? id;
  String? name;
  String? image;

  CategoreyModel({this.image, this.name});

  factory CategoreyModel.fromJson(Map<String, dynamic> data) {
    final name = data['name'] as String; // cast as non-nullable String
    final image = data["image"] as String;
    return CategoreyModel(
      image: image,
      name: name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }

  CategoreyModel.fromQuerySnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    name = snapshot.data()?["name"];
    image = snapshot.data()?["image"];
    id = snapshot.id;
  }
}
