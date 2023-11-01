import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restoran_serba_ada/model/search_model.dart';
import 'package:restoran_serba_ada/model/api/detail_api.dart';

part 'get_detail_event.dart';
part 'get_detail_state.dart';

class GetDetailBloc extends Bloc<GetDetailEvent, GetDetailState> {
  GetDetailBloc() : super(GetDetailInitial()) {
    on<GetDetailAPIEvent>((event, emit) async {
      await getDetailData(
        event,
        emit,
      );
    });
  }
  Future<void> getDetailData(
    GetDetailAPIEvent event,
    Emitter<GetDetailState> emit,
  ) async {
    String id = event.id;
    List<Meal> dataDetail = await DetailAPI.getDetailMealData(id);
    emit(
      ValueDetailMealState(
        data: dataDetail,
      ),
    );
  }
}
