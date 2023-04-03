import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_app/blocs/cart/cart_bloc.dart';
import 'package:self_app/blocs/category/category_bloc.dart';
import 'package:self_app/blocs/checkout/checkout_bloc.dart';
import 'package:self_app/blocs/product/product_bloc.dart';
import 'package:self_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:self_app/repositories/category/category_repository.dart';
import 'package:self_app/repositories/checkout/checkout_repository.dart';
import 'package:self_app/repositories/product/product_repository.dart';
import 'package:self_app/screens/home/home.dart';
import 'package:self_app/screens/splash/splash_screen.dart';

import 'config/app_router.dart';
import 'config/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
            create: (context) => CheckoutBloc(
                cartBloc: context.read<CartBloc>(),
                checkoutRepository: CheckoutRepository())),
        BlocProvider(
          create: (_) => CategoryBloc(categoryRepository: CategoryRepository())
            ..add(LoadCategory()),
        ),
        BlocProvider(
            create: (_) => ProductBloc(productRepository: ProductRepository())
              ..add(LoadProduct())),
      ],
      child: MaterialApp(
        title: 'Zero to Unicorn',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        home: HomeScreen(),
      ),
    );
  }
}
