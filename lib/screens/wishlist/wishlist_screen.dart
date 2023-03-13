import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:self_app/widgets/custom_appbar.dart';
import 'package:self_app/widgets/custom_navbar.dart';

import '../../widgets/product_card.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => WishListScreen());
  }

  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'WishList'),
      bottomNavigationBar: CustomNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
          builder: (BuildContext context, state) {
        if (state is WishlistLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WishlistLoaded) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2.4,
            ),
            itemCount: state.wishlist.products.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: ProductCard(
                  widthFactor: 1.1,
                  leftPosition: 100.0,
                  product: state.wishlist.products[index],
                  isWishList: true,
                ),
              );
            },
          );
        } else{
          return Text('Something went wrong');
        }
      }),
    );
  }
}
