// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cat _$CatFromJson(Map<String, dynamic> json) => Cat(
      length: json['length'] as String,
      origin: json['origin'] as String,
      imageLink: json['imageLink'] as String,
      minWeight: json['minWeight'] as int,
      maxWeight: json['maxWeight'] as int,
      minLifeExpectancy: json['minLifeExpectancy'] as int,
      maxLifeExpectancy: json['maxLifeExpectancy'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CatToJson(Cat instance) => <String, dynamic>{
      'length': instance.length,
      'origin': instance.origin,
      'imageLink': instance.imageLink,
      'minWeight': instance.minWeight,
      'maxWeight': instance.maxWeight,
      'minLifeExpectancy': instance.minLifeExpectancy,
      'maxLifeExpectancy': instance.maxLifeExpectancy,
      'name': instance.name,
    };
