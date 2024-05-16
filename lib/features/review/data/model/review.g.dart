// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      productId: json['productId'] as String,
      user: ApplicationUser.fromJson(json['user'] as Map<String, dynamic>),
      content: json['content'] as String,
      score: json['score'] as num,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'productId': instance.productId,
      'user': instance.user.toJson(),
      'content': instance.content,
      'score': instance.score,
      'createdAt': instance.createdAt.toIso8601String(),
    };
