import 'package:ecommerce_flutter_bloc/screens/home/models/product_model.dart';
import 'package:ecommerce_flutter_bloc/screens/home/ui/blocs/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(2.0)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(6, 12, 12, 12),
                child: Image.network(
                  product.image,
                  height: 80,
                  width: 80,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.category,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "\$ ${product.price}",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Rating: ${product.rating.rate}(${product.rating.count})",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              InkWell(
                onTap: () {
                  if (!product.inWishlist) {
                    context
                        .read<ProductBloc>()
                        .add(AddToWishlistProductEvent(id: product.id));
                  } else {
                    context
                        .read<ProductBloc>()
                        .add(RemoveFromWishlistProductEvent(id: product.id));
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: product.inWishlist
                      ? const Icon(
                          Icons.favorite,
                          size: 24,
                          color: Colors.orange,
                        )
                      : const Icon(
                          Icons.favorite_outline_outlined,
                          size: 24,
                        ),
                ),
              ),
              Expanded(
                  child: TextButton(
                child: const Text(
                  'Add To Bag',
                ),
                onPressed: () {},
              ))
            ],
          )
        ],
      ),
    );
  }
}
