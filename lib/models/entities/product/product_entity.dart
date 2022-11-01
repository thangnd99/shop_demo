import 'package:json_annotation/json_annotation.dart';
import 'package:shop_demo_app/models/entities/product/rating_entity.dart';

part 'product_entity.g.dart';

@JsonSerializable()
class ProductEntity {
  const ProductEntity({
    this.id,
    this.rate,
    this.title,
    this.image,
    this.category,
    this.description,
    this.price,
  });

  @JsonKey()
  final int? id;
  @JsonKey()
  final String? title;
  @JsonKey()
  final String? category;
  @JsonKey()
  final double? price;
  @JsonKey()
  final String? description;
  @JsonKey()
  final String? image;
  @JsonKey(name: 'rating')
  final RatingEntity? rate;

  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductEntityToJson(this);
}
