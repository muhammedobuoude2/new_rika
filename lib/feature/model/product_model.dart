// ignore_for_file: unused_label, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String? categreyId;
  String? image;
  String? name;
  String? price;
  String? description;
  String? body;
  String? bodytitle;

  ProductModel(
      {this.categreyId,
      this.image,
      this.name,
      this.price,
      this.description,
      this.body,
      this.bodytitle});

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    final categreyId = data['categreyId'] as String?;
    final image = data["image"] as String?;
    final name = data["name"] as String?;
    final price = data["price"] as String?;
    final description = data["description"] as String?;
    final body = data["body"] as String?;
    final bodytitle = data["bodytitle"] as String?;

    return ProductModel(
        description: description,
        price: price,
        name: name,
        image: image,
        categreyId: categreyId,
        bodytitle: bodytitle,
        body: body);
  }

  ProductModel.fromQuerySnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    categreyId = snapshot.data()?["categreyId"];
    image = snapshot.data()?["image"];
    name = snapshot.data()?["name"];
    price = snapshot.data()?["price"];
    description = snapshot.data()?["description"];
    bodytitle = snapshot.data()?["bodytitle"];
    body = snapshot.data()?["body"];
  }
}
