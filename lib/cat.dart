import 'package:json_annotation/json_annotation.dart';

part 'cat.g.dart';

@JsonSerializable()
class Cat {
  String length;
  String origin;
  String imageLink;
  int minWeight;
  int maxWeight;
  int minLifeExpectancy;
  int maxLifeExpectancy;
  String name;

  Cat({
    required this.length,
    required this.origin,
    required this.imageLink,
    required this.minWeight,
    required this.maxWeight,
    required this.minLifeExpectancy,
    required this.maxLifeExpectancy,
    required this.name,
  });

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);


}
