import 'package:json_annotation/json_annotation.dart';

part 'rating_entity.g.dart';

@JsonSerializable()
class RatingEntity {
  const RatingEntity({
    this.rate,
    this.count,
  });

  @JsonKey(name: 'rate')
  final double? rate;
  @JsonKey(name: 'count')
  final int? count;

  factory RatingEntity.fromJson(Map<String, dynamic> json) =>
      _$RatingEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RatingEntityToJson(this);
}
