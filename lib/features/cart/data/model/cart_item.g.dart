// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      userId: json['userId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      productColor:
          $enumDecodeNullable(_$ProductColorEnumMap, json['productColor']),
      size: (json['size'] as num?)?.toInt(),
    );

const _$ProductColorEnumMap = {
  ProductColor.black: 'black',
  ProductColor.white: 'white',
  ProductColor.red: 'red',
};
