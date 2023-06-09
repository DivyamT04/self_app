import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_app/repositories/product/product_repository.dart';

import '../../models/product_model.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is LoadProduct) {
      yield* _mapLoadProductToState();
    } else if (event is UpdateProduct) {
      yield* _mapUpdateProductToState(event);
    }
  }

  Stream<ProductState> _mapLoadProductToState() async* {
    _productSubscription?.cancel();
    _productSubscription = _productRepository
        .getAllProducts()
        .listen((products) => add(UpdateProduct(products: products)));
  }

  Stream<ProductState> _mapUpdateProductToState(UpdateProduct event) async* {
    yield ProductLoaded(products: event.products);
  }
}
