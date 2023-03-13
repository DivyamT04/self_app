import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_app/blocs/category/category_bloc.dart';
import 'package:self_app/blocs/product/product_bloc.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/hero_carousal_card.dart';
import '../../widgets/product_carousal.dart';
import '../../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Shopify'),
      bottomNavigationBar: const CustomNavBar(),
      body: ListView(children: [
        Container(
          child: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CategoryLoaded) {
                return CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 1.5,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                  items: state.categories
                      .map((category) => HeroCarousalCard(category: category))
                      .toList(),
                );
              } else {
                return Text('Something went Wrong!');
              }
            },
          ),
        ),
        SectionTitle(title: 'RECOMMENDED'),
        BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductLoaded) {
              return ProductCarousal(
                products: state.products
                    .where((products) => products.isRecommended)
                    .toList(),
              );
            } else {
              return Text('Something went wrong');
            }
          },
        ),
        SectionTitle(title: 'MOST POPULAR'),
        BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductLoaded) {
              return ProductCarousal(
                products: state.products
                    .where((products) => products.isPopular)
                    .toList(),
              );
            } else {
              return Text('Something went wrong');
            }
          },
        )
      ]),
    );
  }
}
