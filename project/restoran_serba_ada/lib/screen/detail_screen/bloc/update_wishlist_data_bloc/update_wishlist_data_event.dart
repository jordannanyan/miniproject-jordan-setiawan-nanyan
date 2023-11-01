part of 'update_wishlist_data_bloc.dart';

sealed class UpdateWishlistDataEvent extends Equatable {
  const UpdateWishlistDataEvent();

  @override
  List<Object> get props => [];
}

final class GetWishlistDataEvent extends UpdateWishlistDataEvent {
  final int data;

  const GetWishlistDataEvent({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
