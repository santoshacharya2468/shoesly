// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
      brand: Brand.fromJson(json['brand'] as Map<String, dynamic>),
      avgRating: json['avgRating'] as num,
      totalReviews: (json['totalReviews'] as num).toInt(),
      sizes: (json['sizes'] as List<dynamic>).map((e) => e as num).toList(),
      colors:
          (json['colors'] as List<dynamic>).map((e) => e as String).toList(),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
    )..createdAt = json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'brand': instance.brand.toJson(),
      'avgRating': instance.avgRating,
      'totalReviews': instance.totalReviews,
      'sizes': instance.sizes,
      'colors': instance.colors,
      'gender': _$GenderEnumMap[instance.gender]!,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$GenderEnumMap = {
  Gender.men: 'men',
  Gender.women: 'women',
  Gender.unisex: 'unisex',
};
