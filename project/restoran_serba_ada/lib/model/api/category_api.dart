import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:restoran_serba_ada/model/category_model.dart';

class CategoryAPI {
  static Future<List<Meal>> getCategoryData() async {
    List<Meal> listMeals = [];
    try {
      final response = await Dio()
          .get('https://www.themealdb.com/api/json/v1/1/list.php?c=list');
      final data = categoryDataFromJson(json.encode(response.data));
      listMeals = data.meals;
    } catch (e) {
      print(e);
    }
    return listMeals;
  }
}
