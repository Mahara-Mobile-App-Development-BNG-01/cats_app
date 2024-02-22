// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cat _$CatFromJson(Map<String, dynamic> json) => Cat(
      length: json['length'] as String,
      origin: json['origin'] as String,
      imageLink: json['image_link'] as String,
      minWeight: json['min_weight'] as int,
      maxWeight: json['max_weight'] as int,
      minLifeExpectancy: json['min_life_expectancy'] as int,
      maxLifeExpectancy: json['max_life_expectancy'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CatToJson(Cat instance) => <String, dynamic>{
      'length': instance.length,
      'origin': instance.origin,
      'image_link': instance.imageLink,
      'min_weight': instance.minWeight,
      'max_weight': instance.maxWeight,
      'min_life_expectancy': instance.minLifeExpectancy,
      'max_life_expectancy': instance.maxLifeExpectancy,
      'name': instance.name,
    };
