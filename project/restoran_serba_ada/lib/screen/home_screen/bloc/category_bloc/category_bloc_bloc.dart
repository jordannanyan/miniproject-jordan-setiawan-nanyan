import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restoran_serba_ada/model/api/category_api.dart';
import 'package:restoran_serba_ada/model/category_model.dart';

part 'category_bloc_event.dart';
part 'category_bloc_state.dart';

class CategoryBloc extends Bloc<CategoryBlocEvent, CategoryBlocState> {
  CategoryBloc() : super(CategoryBlocInitial()) {
    on<GetCategoryEvent>((event, emit) async {
      await getCategories(event, emit);
    });
  }
  Future<void> getCategories(
      GetCategoryEvent event, Emitter<CategoryBlocState> emit) async {
    emit(LoadingDataState());
    List<Meal> data = await CategoryAPI.getCategoryData();
    emit(ValueCategoryState(categoryData: data));
  }
}
