import 'package:ecommerce_flutter_bloc/screens/home/models/product_model.dart';
import 'package:ecommerce_flutter_bloc/screens/home/ui/blocs/product/product_bloc.dart';
import 'package:ecommerce_flutter_bloc/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(FetchProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listenWhen: (previous, current) => current is ProductActionState,
      listener: (context, state) {
        if (state is AddedToWishlistSuccessProductState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product added to wishlist.'),
            ),
          );
        } else if (state is RemovedFromWishlistSuccessProductState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product removed from wishlist.'),
            ),
          );
        }
      },
      buildWhen: (previous, current) => current is! ProductActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadingProductState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ErrorOnLoadingProductState:
            return const Center(
              child: Text(
                'Oops.! Error occurred while loading products.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            );
          case ProductListProductState:
            List<ProductModel> products =
                (state as ProductListProductState).productList;
            return Container(
              margin: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductTile(
                    product: products[index],
                  );
                },
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
