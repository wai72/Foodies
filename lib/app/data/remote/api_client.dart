import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/category.dart';
import '../../models/food.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://www.themealdb.com/api/json/v1/1")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/categories.php")
  Future<List<Category>> getCategories();

  @GET("/filter.php")
  Future<List<Food>> getFoods(@Query("c") String category);
}
