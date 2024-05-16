import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shoesly/core/decorator/json_decorator.dart';
import 'package:shoesly/core/enum/product_gender.dart';
import 'package:shoesly/features/brand/data/model/brand.dart';
part "product.g.dart";

@model
class Product {
  @JsonKey(includeToJson: true)
  String? id;
  final String name;
  final String description;
  final String image;
  final double price;
  final Brand brand;
  final num avgRating;
  final int totalReviews;
  final List<num> sizes;
  final List<String> colors;
  final Gender gender;
  DateTime? createdAt;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.price,
      required this.brand,
      required this.avgRating,
      required this.totalReviews,
      required this.sizes,
      required this.colors,
      required this.gender});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  factory Product.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final p = Product.fromJson(doc.data());
    p.id = doc.id;
    return p;
  }
}
