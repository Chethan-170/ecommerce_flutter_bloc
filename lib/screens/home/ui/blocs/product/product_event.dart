part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class FetchProductEvent extends ProductEvent {}

class AddToWishlistProductEvent extends ProductEvent {
  final int id;

  AddToWishlistProductEvent({required this.id});
}

class RemoveFromWishlistProductEvent extends ProductEvent {
  final int id;

  RemoveFromWishlistProductEvent({required this.id});
}
