import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

@JsonSerializable()
class Food {
  @JsonKey(name: 'idMeal')
  final String id;

  @JsonKey(name: 'strMeal')
  final String name;

  @JsonKey(name: 'strMealThumb')
  final String thumbnail;

  Food({required this.id, required this.name, required this.thumbnail});

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
