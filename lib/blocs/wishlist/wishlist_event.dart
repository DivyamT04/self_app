part of 'wishlist_bloc.dart';

abstract class WishlistEvents extends Equatable {
  const WishlistEvents();

  @override
  List<Object> get props => [];
}

class StartWishlist extends WishlistEvents {}

class AddWishlistProduct extends WishlistEvents {
  final Product product;

  const AddWishlistProduct({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}

class RemoveWishlistProduct extends WishlistEvents {
  final Product product;

  const RemoveWishlistProduct({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}
