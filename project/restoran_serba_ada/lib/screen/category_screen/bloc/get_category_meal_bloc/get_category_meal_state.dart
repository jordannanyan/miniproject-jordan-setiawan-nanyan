part of 'get_category_meal_bloc.dart';

sealed class GetCategoryMealState extends Equatable {
  const GetCategoryMealState();

  @override
  List<Object> get props => [];
}

final class GetCategoryMealInitial extends GetCategoryMealState {}

final class ValueCategoryMealDataState extends GetCategoryMealState {
  final List<Meal> data;

  const ValueCategoryMealDataState({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
