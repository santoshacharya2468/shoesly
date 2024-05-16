import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shoesly/core/decorator/json_decorator.dart';
import 'package:shoesly/core/model/application_user.dart';
part "review.g.dart";

@model
class Review {
  @JsonKey(includeToJson: false, includeFromJson: false)
  String? id;
  final String productId;
  final ApplicationUser user;
  final String content;
  final num score;
  final DateTime createdAt;

  Review(
      {this.id,
      required this.productId,
      required this.user,
      required this.content,
      required this.score,
      required this.createdAt});

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);

  factory Review.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final r = Review.fromJson(doc.data());
    r.id = doc.id;
    return r;
  }
}
