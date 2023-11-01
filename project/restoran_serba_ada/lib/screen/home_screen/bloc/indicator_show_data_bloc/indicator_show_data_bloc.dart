import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'indicator_show_data_event.dart';
part 'indicator_show_data_state.dart';

class IndicatorShowDataBloc
    extends Bloc<IndicatorShowDataEvent, IndicatorShowDataState> {
  IndicatorShowDataBloc() : super(IndicatorShowDataInitial()) {
    on<ChangeIndicatorShowDataEvent>((event, emit) {
      changeIndicatorData(event, emit);
    });
  }
  changeIndicatorData(ChangeIndicatorShowDataEvent event,
      Emitter<IndicatorShowDataState> emit) {
    bool data = event.data;
    emit(
      ValueIndicatorShowDataState(data: data),
    );
  }
}
