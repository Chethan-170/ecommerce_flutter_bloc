part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {}

@immutable
abstract class ProductActionState extends ProductState {}

class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

class LoadingProductState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductListProductState extends ProductState {
  final List<ProductModel> productList;

  ProductListProductState({required this.productList});

  ProductListProductState copyWith({List<ProductModel> list = const []}) {
    return ProductListProductState(productList: list);
  }

  @override
  List<Object?> get props => [productList];
}

class ErrorOnLoadingProductState extends ProductState {
  @override
  List<Object?> get props => [];
}

class AddedToWishlistSuccessProductState extends ProductActionState {
  @override
  List<Object?> get props => [];
}

class RemovedFromWishlistSuccessProductState extends ProductActionState {
  @override
  List<Object?> get props => [];
}
