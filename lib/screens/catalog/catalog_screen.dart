import 'package:flutter/material.dart';
import 'package:self_app/widgets/custom_appbar.dart';
import 'package:self_app/widgets/custom_navbar.dart';
import 'package:self_app/widgets/product_card.dart';
import '../../models/category_model.dart';
import '../../models/product_model.dart';

class CatalogScreen extends StatelessWidget {
  final Categorym category;
  static const String routeName = '/catalog';

  static Route route({required Categorym category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => CatalogScreen(category: category));
  }

  const CatalogScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((products) => products.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 16.0,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.15,
        ),
        itemCount: categoryProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: ProductCard(
              widthFactor: 2.2,
              product: categoryProducts[index],
            ),
          );
        },
      ),
    );
  }
}
