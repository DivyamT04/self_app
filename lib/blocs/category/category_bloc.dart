import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/category_model.dart';
import '../../repositories/category/category_repository.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is LoadCategory) {
      yield* _mapLoadCategoryToState();
    } else if (event is UpdateCategory) {
      yield* _mapUpdateCategoryToState(event);
    }
  }

  Stream<CategoryState> _mapLoadCategoryToState() async* {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository
        .getAllCategories()
        .listen((categories) => add(UpdateCategory(categories: categories)));
  }

  Stream<CategoryState> _mapUpdateCategoryToState(
      UpdateCategory event) async* {
    yield CategoryLoaded(categories: event.categories);
  }
}
