import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:restoran_serba_ada/model/category_list_model.dart';

class CategoryMealListAPI {
  static Future<List<Meal>> getCategoryMealData(String category) async {
    List<Meal> listMeals = [];
    try {
      final response = await Dio().get(
          'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category');
      final data = categoryMealListFromJson(json.encode(response.data));
      listMeals = data.meals;
    } catch (e) {
      print(e);
    }
    return listMeals;
  }
}
