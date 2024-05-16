import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/core/decorator/json_decorator.dart';

part "brand.g.dart";

@model
class Brand {
  String? id;
  final String name;
  final String logo;
  final int totalProducts;
  Brand({required this.name, required this.logo, required this.totalProducts});

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
  factory Brand.fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final brand = Brand.fromJson(doc.data());
    brand.id = doc.id;
    return brand;
  }

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}
