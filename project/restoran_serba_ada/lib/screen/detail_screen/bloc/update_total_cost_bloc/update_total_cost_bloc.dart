import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_total_cost_event.dart';
part 'update_total_cost_state.dart';

class UpdateTotalCostBloc
    extends Bloc<UpdateTotalCostEvent, UpdateTotalCostState> {
  UpdateTotalCostBloc() : super(UpdateTotalCostInitial()) {
    on<GetTotalCostEvent>((event, emit) {
      int data = event.data;
      emit(ValueTotalCostState(data: data));
    });
  }
}
