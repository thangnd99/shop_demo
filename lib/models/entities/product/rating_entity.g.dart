// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingEntity _$RatingEntityFromJson(Map<String, dynamic> json) => RatingEntity(
      rate: (json['rate'] as num?)?.toDouble(),
      count: json['count'] as int?,
    );

Map<String, dynamic> _$RatingEntityToJson(RatingEntity instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };
