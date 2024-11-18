import 'package:get/get.dart';
import '../models/category.dart';
import '../models/food.dart';
import '../data/remote/api_client.dart';
import 'package:dio/dio.dart';

class CategoryController extends GetxController {
var categories = <Category>[].obs;
var foods = <Food>[].obs;
  var selectedCategory = ''.obs;
  var isLoading = false.obs;

  late ApiClient apiClient;

  @override
  void onInit() {
    super.onInit();
    final dio = Dio();
    apiClient = ApiClient(dio);
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      isLoading.value = true;
      final response = await apiClient.getCategories();
     categories.assignAll(response);
     print("fetching categories: $response");
      if (categories.isNotEmpty) {
        selectedCategory.value = categories.first.name;
        fetchFoods(categories.first.name);
      }
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void fetchFoods(String category) async {
    try {
      isLoading.value = true;
      final response = await apiClient.getFoods(category);
     foods.assignAll(response);
    } catch (e) {
      print("Error fetching foods: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
