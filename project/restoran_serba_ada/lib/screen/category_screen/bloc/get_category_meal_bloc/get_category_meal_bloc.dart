import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restoran_serba_ada/model/api/category_list_api.dart';
import 'package:restoran_serba_ada/model/category_list_model.dart';

part 'get_category_meal_event.dart';
part 'get_category_meal_state.dart';

class GetCategoryMealBloc
    extends Bloc<GetCategoryMealEvent, GetCategoryMealState> {
  GetCategoryMealBloc() : super(GetCategoryMealInitial()) {
    on<GetCategoryDataEvent>((event, emit) async {
      await getCategoryMeal(event, emit);
    });
  }
  Future<void> getCategoryMeal(
      GetCategoryDataEvent event, Emitter<GetCategoryMealState> emit) async {
    String data = event.category;
    List<Meal> listData = await CategoryMealListAPI.getCategoryMealData(data);
    emit(ValueCategoryMealDataState(data: listData));
  }
}
