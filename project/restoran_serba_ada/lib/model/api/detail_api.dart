import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:restoran_serba_ada/model/search_model.dart';

class DetailAPI {
  static Future<List<Meal>> getDetailMealData(String idMeal) async {
    List<Meal> listMeals = [];
    try {
      final response = await Dio()
          .get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$idMeal');
      final data = searchDataFromJson(json.encode(response.data));
      listMeals = data.meals;
      print('object');
    } catch (e) {
      print(e);
    }
    return listMeals;
  }
}
