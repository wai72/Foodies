// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
      id: json['idMeal'] as String,
      name: json['strMeal'] as String,
      thumbnail: json['strMealThumb'] as String,
    );

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'idMeal': instance.id,
      'strMeal': instance.name,
      'strMealThumb': instance.thumbnail,
    };
