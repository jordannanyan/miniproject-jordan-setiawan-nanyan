part of 'category_bloc_bloc.dart';

sealed class CategoryBlocEvent extends Equatable {
  const CategoryBlocEvent();

  @override
  List<Object> get props => [];
}

final class GetCategoryEvent extends CategoryBlocEvent {}
