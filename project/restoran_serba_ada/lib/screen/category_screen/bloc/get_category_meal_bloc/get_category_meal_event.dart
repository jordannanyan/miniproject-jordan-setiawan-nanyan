part of 'get_category_meal_bloc.dart';

sealed class GetCategoryMealEvent extends Equatable {
  const GetCategoryMealEvent();

  @override
  List<Object> get props => [];
}

final class GetCategoryDataEvent extends GetCategoryMealEvent {
  final String category;

  const GetCategoryDataEvent({
    required this.category,
  });

  @override
  List<Object> get props => [category];
}
