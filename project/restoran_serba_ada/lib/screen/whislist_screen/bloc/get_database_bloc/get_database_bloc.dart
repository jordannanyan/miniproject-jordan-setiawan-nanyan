import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restoran_serba_ada/model/helper/database_helper.dart';
import 'package:restoran_serba_ada/model/wishlist_model.dart';

part 'get_database_event.dart';
part 'get_database_state.dart';

class GetDatabaseBloc extends Bloc<GetDatabaseEvent, GetDatabaseState> {
  GetDatabaseBloc() : super(GetDatabaseInitial()) {
    on<GetAllWishlistEvent>((event, emit) async {
      await getAllWishlist(event, emit);
    });
    on<GetWishlistByIdEvent>((event, emit) async {
      await getWishlistById(event, emit);
    });
    on<UpdateWishlistEvent>((event, emit) async {
      await updateWishlist(event, emit);
    });
    on<DeleteWishlistByIdEvent>((event, emit) async {
      await deleteWishlist(event, emit);
    });
    on<InsertWishlistEvent>((event, emit) async {
      await insertWishlist(event, emit);
    });
  }
  Future<void> getAllWishlist(
    GetAllWishlistEvent event,
    Emitter<GetDatabaseState> emit,
  ) async {
    List<WishlistModel> wishlistData = await DatabaseHelper().getWishlist();
    emit(ValueAllWishlistState(wishlistModel: wishlistData));
  }

  Future<void> getWishlistById(
    GetWishlistByIdEvent event,
    Emitter<GetDatabaseState> emit,
  ) async {
    WishlistModel wishlistModel = await DatabaseHelper().getWishlistById(
      event.id,
    );
    emit(
      ValueGetWishlistByIdState(
        wishlistModel: wishlistModel,
      ),
    );
  }

  Future<void> updateWishlist(
    UpdateWishlistEvent event,
    Emitter<GetDatabaseState> emit,
  ) async {
    await DatabaseHelper().updateWishlist(
      event.wishlistModel,
    );
    List<WishlistModel> dataList = await DatabaseHelper().getWishlist();
    emit(
      ValueUpdateWishlistState(wishlistModel: dataList),
    );
  }

  Future<void> deleteWishlist(
    DeleteWishlistByIdEvent event,
    Emitter<GetDatabaseState> emit,
  ) async {
    await DatabaseHelper().deleteWishlist(event.id);
    List<WishlistModel> dataList = await DatabaseHelper().getWishlist();
    emit(
      ValueDeleteWishlistState(wishlistModel: dataList),
    );
  }

  Future<void> insertWishlist(
    InsertWishlistEvent event,
    Emitter<GetDatabaseState> emit,
  ) async {
    await DatabaseHelper().insertWishlist(
      event.wishlistModel,
    );
    emit(
      const ValueInsertWishlistState(
        message: 'Data Berhasil di Masukan',
      ),
    );
  }
}
