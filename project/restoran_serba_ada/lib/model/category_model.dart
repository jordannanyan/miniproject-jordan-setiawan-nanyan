import 'dart:convert';

CategoryData categoryDataFromJson(String str) =>
    CategoryData.fromJson(json.decode(str));

String categoryDataToJson(CategoryData data) => json.encode(data.toJson());

class CategoryData {
  List<Meal> meals;

  CategoryData({
    required this.meals,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
      };
}

class Meal {
  String strCategory;

  Meal({
    required this.strCategory,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        strCategory: json["strCategory"],
      );

  Map<String, dynamic> toJson() => {
        "strCategory": strCategory,
      };
}
