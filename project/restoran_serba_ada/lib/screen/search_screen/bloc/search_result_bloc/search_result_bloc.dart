import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restoran_serba_ada/model/api/search_api.dart';
import 'package:restoran_serba_ada/model/search_model.dart';

part 'search_result_event.dart';
part 'search_result_state.dart';

class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  SearchResultBloc() : super(SearchResultInitial()) {
    on<GetSearchResultEvent>((event, emit) async {
      await getSearchResult(event, emit);
    });
    on<EmptySearchResultEvent>((event, emit) {
      emit(EmptySearchResultState());
    });
  }
  Future<void> getSearchResult(
    GetSearchResultEvent event,
    Emitter<SearchResultState> emit,
  ) async {
    emit(LoadingSearchResultState());
    String search = event.searchText;
    List<Meal> searchData = await SearchAPI.getSearchData(search);
    emit(
      ValueSearchResultState(
        data: searchData,
      ),
    );
  }
}
