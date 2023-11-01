import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restoran_serba_ada/model/api/open_ai_api.dart';
import 'package:restoran_serba_ada/model/open_ai_model.dart';

part 'get_description_event.dart';
part 'get_description_state.dart';

class GetDescriptionBloc
    extends Bloc<GetDescriptionEvent, GetDescriptionState> {
  GetDescriptionBloc() : super(GetDescriptionInitial()) {
    on<GetMenuDescriptionAPIEvent>((event, emit) async {
      await getMenuDescription(
        event,
        emit,
      );
    });
  }
  Future<void> getMenuDescription(GetMenuDescriptionAPIEvent event,
      Emitter<GetDescriptionState> emit) async {
    String menu = event.menu;
    final GptData data = await DescriptionService.getDescription(
      menu: menu,
    );
    emit(ValueMenuDescriptionState(
      desc: data,
    ));
  }
}
