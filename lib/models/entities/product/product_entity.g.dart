// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductEntity _$ProductEntityFromJson(Map<String, dynamic> json) =>
    ProductEntity(
      id: json['id'] as int?,
      rate: json['rating'] == null
          ? null
          : RatingEntity.fromJson(json['rating'] as Map<String, dynamic>),
      title: json['title'] as String?,
      image: json['image'] as String?,
      category: json['category'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductEntityToJson(ProductEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'price': instance.price,
      'description': instance.description,
      'image': instance.image,
      'rating': instance.rate,
    };
