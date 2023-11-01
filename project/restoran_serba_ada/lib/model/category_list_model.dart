import 'dart:convert';

CategoryMealList categoryMealListFromJson(String str) =>
    CategoryMealList.fromJson(json.decode(str));

String categoryMealListToJson(CategoryMealList data) =>
    json.encode(data.toJson());

class CategoryMealList {
  List<Meal> meals;

  CategoryMealList({
    required this.meals,
  });

  factory CategoryMealList.fromJson(Map<String, dynamic> json) =>
      CategoryMealList(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
      };
}

class Meal {
  String strMeal;
  String strMealThumb;
  String idMeal;

  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
      );

  Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
      };
}
