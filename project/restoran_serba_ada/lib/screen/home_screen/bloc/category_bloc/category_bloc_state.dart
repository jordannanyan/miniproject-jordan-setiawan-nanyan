part of 'category_bloc_bloc.dart';

sealed class CategoryBlocState extends Equatable {
  const CategoryBlocState();

  @override
  List<Object> get props => [];
}

final class CategoryBlocInitial extends CategoryBlocState {}

final class ValueCategoryState extends CategoryBlocState {
  final List<Meal> categoryData;

  const ValueCategoryState({
    required this.categoryData,
  });

  @override
  List<Object> get props => [categoryData];
}

final class LoadingDataState extends CategoryBlocState {}
