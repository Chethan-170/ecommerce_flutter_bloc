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

  ProductListProductState(this.productList);

  @override
  List<Object?> get props => [productList];
}

class ErrorProductState extends ProductState {
  @override
  List<Object?> get props => [];
}
