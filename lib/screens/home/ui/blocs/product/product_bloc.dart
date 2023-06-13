import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter_bloc/screens/home/models/product_model.dart';
import 'package:ecommerce_flutter_bloc/services/product_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<FetchProductEvent>(_handleFetchProductEvent);
    on<AddToWishlistProductEvent>(_handleAddToWishlistProductEvent);
    on<RemoveFromWishlistProductEvent>(_handleRemoveFromWishlistProductEvent);
  }

  FutureOr<void> _handleFetchProductEvent(
      FetchProductEvent event, Emitter<ProductState> emit) async {
    emit(LoadingProductState());
    try {
      List<ProductModel> products = await ProductService.fetchProducts();
      emit(ProductListProductState(productList: products));
    } catch (e) {
      emit(ErrorOnLoadingProductState());
    }
  }

  FutureOr<void> _handleAddToWishlistProductEvent(
      AddToWishlistProductEvent event, Emitter<ProductState> emit) {
    ProductListProductState productListProductState =
        state as ProductListProductState;
    List<ProductModel> updatedProductList =
        productListProductState.productList.map((e) {
      if (e.id == event.id) {
        ProductModel updatedProduct = ProductModel(
          id: e.id,
          title: e.title,
          price: e.price,
          description: e.description,
          category: e.category,
          image: e.image,
          rating: e.rating,
          inBasket: e.inBasket,
          inWishlist: true,
        );
        return updatedProduct;
      }
      return e;
    }).toList();
    emit(AddedToWishlistSuccessProductState());
    emit(productListProductState.copyWith(list: updatedProductList));
  }

  FutureOr<void> _handleRemoveFromWishlistProductEvent(
      RemoveFromWishlistProductEvent event, Emitter<ProductState> emit) {
    ProductListProductState productListProductState =
        state as ProductListProductState;
    List<ProductModel> updatedProductList =
        productListProductState.productList.map((e) {
      if (e.id == event.id) {
        ProductModel updatedProduct = ProductModel(
          id: e.id,
          title: e.title,
          price: e.price,
          description: e.description,
          category: e.category,
          image: e.image,
          rating: e.rating,
          inBasket: e.inBasket,
          inWishlist: false,
        );
        return updatedProduct;
      }
      return e;
    }).toList();
    emit(RemovedFromWishlistSuccessProductState());
    emit(productListProductState.copyWith(list: updatedProductList));
  }
}
