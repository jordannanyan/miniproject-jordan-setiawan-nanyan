part of 'update_wishlist_data_bloc.dart';

sealed class UpdateWishlistDataState extends Equatable {
  const UpdateWishlistDataState();

  @override
  List<Object> get props => [];
}

final class UpdateWishlistDataInitial extends UpdateWishlistDataState {}

final class ValueWishlistCountState extends UpdateWishlistDataState {
  final int data;

  const ValueWishlistCountState({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
