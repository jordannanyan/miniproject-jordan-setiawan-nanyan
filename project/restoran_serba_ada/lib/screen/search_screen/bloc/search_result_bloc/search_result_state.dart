part of 'search_result_bloc.dart';

sealed class SearchResultState extends Equatable {
  const SearchResultState();

  @override
  List<Object> get props => [];
}

final class SearchResultInitial extends SearchResultState {}

final class ValueSearchResultState extends SearchResultState {
  final List<Meal> data;

  const ValueSearchResultState({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

final class LoadingSearchResultState extends SearchResultState {}

final class EmptySearchResultState extends SearchResultState {}
