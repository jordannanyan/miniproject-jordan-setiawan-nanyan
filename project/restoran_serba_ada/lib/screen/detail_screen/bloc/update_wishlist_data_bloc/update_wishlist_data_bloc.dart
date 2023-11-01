import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_wishlist_data_event.dart';
part 'update_wishlist_data_state.dart';

class UpdateWishlistDataBloc
    extends Bloc<UpdateWishlistDataEvent, UpdateWishlistDataState> {
  UpdateWishlistDataBloc() : super(UpdateWishlistDataInitial()) {
    on<GetWishlistDataEvent>((event, emit) {
      changeWishlistNumber(event, emit);
    });
  }
  void changeWishlistNumber(
    GetWishlistDataEvent event,
    Emitter<UpdateWishlistDataState> emit,
  ) {
    int data = event.data;
    emit(
      ValueWishlistCountState(
        data: data,
      ),
    );
  }
}
