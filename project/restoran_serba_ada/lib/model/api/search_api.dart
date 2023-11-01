import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:restoran_serba_ada/model/search_model.dart';

class SearchAPI {
  static Future<List<Meal>> getSearchData(String searchText) async {
    List<Meal> listMeals = [];
    try {
      final response = await Dio().get(
          'https://www.themealdb.com/api/json/v1/1/search.php?s=$searchText');
      final data = searchDataFromJson(json.encode(response.data));
      listMeals = data.meals;
    } catch (e) {
      print(e);
    }
    return listMeals;
  }
}
