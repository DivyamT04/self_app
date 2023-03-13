import 'package:flutter/material.dart';
import 'package:self_app/widgets/product_card.dart';
import '../models/product_model.dart';

class ProductCarousal extends StatelessWidget {
  final List<Product> products;
  const ProductCarousal({
    Key? key,
    required this.products
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0, vertical: 10.0),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: ProductCard(product: products[index]),
            );
          }),
    );
  }
}

