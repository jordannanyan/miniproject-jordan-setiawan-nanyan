part of 'search_result_bloc.dart';

sealed class SearchResultEvent extends Equatable {
  const SearchResultEvent();

  @override
  List<Object> get props => [];
}

final class GetSearchResultEvent extends SearchResultEvent {
  final String searchText;

  const GetSearchResultEvent({
    required this.searchText,
  });

  @override
  List<Object> get props => [searchText];
}

final class EmptySearchResultEvent extends SearchResultEvent {}
