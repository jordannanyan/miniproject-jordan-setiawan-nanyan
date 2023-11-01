part of 'get_database_bloc.dart';

sealed class GetDatabaseEvent extends Equatable {
  const GetDatabaseEvent();

  @override
  List<Object> get props => [];
}

final class GetAllWishlistEvent extends GetDatabaseEvent {}

final class AddWishlistEvent extends GetDatabaseEvent {
  final WishlistModel wishlistModel;

  const AddWishlistEvent({
    required this.wishlistModel,
  });

  @override
  List<Object> get props => [wishlistModel];
}

final class GetWishlistByIdEvent extends GetDatabaseEvent {
  final String id;

  const GetWishlistByIdEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

final class UpdateWishlistEvent extends GetDatabaseEvent {
  final WishlistModel wishlistModel;

  const UpdateWishlistEvent({
    required this.wishlistModel,
  });

  @override
  List<Object> get props => [wishlistModel];
}

final class DeleteWishlistByIdEvent extends GetDatabaseEvent {
  final String id;

  const DeleteWishlistByIdEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

final class InsertWishlistEvent extends GetDatabaseEvent {
  final WishlistModel wishlistModel;

  const InsertWishlistEvent({
    required this.wishlistModel,
  });

  @override
  List<Object> get props => [wishlistModel];
}
