import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_login_data_event.dart';
part 'get_login_data_state.dart';

class GetInputLoginDataBloc extends Bloc<GetLoginDataEvent, GetLoginDataState> {
  GetInputLoginDataBloc() : super(GetLoginDataInitial()) {
    on<GetUsernameEvent>((event, emit) {
      String username = event.data;
      emit(ValueUsernameState(data: username));
    });
    on<GetPasswordEvent>((event, emit) {
      String password = event.data;
      emit(ValuePasswordState(data: password));
    });
  }
}
