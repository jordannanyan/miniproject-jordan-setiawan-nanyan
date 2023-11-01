part of 'get_database_bloc.dart';

sealed class GetDatabaseState extends Equatable {
  const GetDatabaseState();

  @override
  List<Object> get props => [];
}

final class GetDatabaseInitial extends GetDatabaseState {}

final class ValueAllWishlistState extends GetDatabaseState {
  final List<WishlistModel> wishlistModel;

  const ValueAllWishlistState({
    required this.wishlistModel,
  });

  @override
  List<Object> get props => [wishlistModel];
}

final class ValueInsertWishlistState extends GetDatabaseState {
  final String message;

  const ValueInsertWishlistState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

final class ValueGetWishlistByIdState extends GetDatabaseState {
  final WishlistModel wishlistModel;

  const ValueGetWishlistByIdState({
    required this.wishlistModel,
  });

  @override
  List<Object> get props => [wishlistModel];
}

final class ValueUpdateWishlistState extends GetDatabaseState {
  final List<WishlistModel> wishlistModel;

  const ValueUpdateWishlistState({
    required this.wishlistModel,
  });

  @override
  List<Object> get props => [wishlistModel];
}

final class ValueDeleteWishlistState extends GetDatabaseState {
  final List<WishlistModel> wishlistModel;

  const ValueDeleteWishlistState({
    required this.wishlistModel,
  });

  @override
  List<Object> get props => [wishlistModel];
}
