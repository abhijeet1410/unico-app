// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int id;
  String name;
  String productImage;
  int basePrice;
  int price;
  int review;

  Product({
    required this.id,
    required this.name,
    required this.productImage,
    required this.basePrice,
    required this.price,
    required this.review,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    productImage: json["productImage"],
    basePrice: json["basePrice"],
    price: json["price"],
    review: json["review"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "productImage": productImage,
    "basePrice": basePrice,
    "price": price,
    "review": review,
  };
}
