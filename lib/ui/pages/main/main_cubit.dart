import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_demo_app/models/enums/load_status.dart';
import 'package:shop_demo_app/repositories/product_repository.dart';

import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final ProductRepository productRepository;

  MainCubit({
    required this.productRepository,
  }) : super(const MainState());

  void onChangedCategory(int index) async {
    emit(state.copyWith(categorySelected: index));
    if (state.categorySelected == 0) {
      await getAllProduct();
    } else {
      await getByCategory(categoryName: state.categories[index]);
    }
  }

  Future<void> getAllCategory() async {
    emit(state.copyWith(loadCategoriesStatus: LoadStatus.loading));
    try {
      final result = await productRepository.getAllCategories();
      if (result.isNotEmpty) {
        final listCate = List<String>.from(state.categories)..addAll(result);
        emit(state.copyWith(
          categories: listCate,
          loadCategoriesStatus: LoadStatus.success,
        ));
      }
    } catch (e) {
      emit(state.copyWith(loadCategoriesStatus: LoadStatus.failure));
    }
  }

  Future<void> getAllProduct() async {
    emit(state.copyWith(loadAllProductStatus: LoadStatus.loading));
    try {
      final result = await productRepository.getProductList();
      if (result.isNotEmpty) {
        emit(state.copyWith(
          products: result,
          loadAllProductStatus: LoadStatus.success,
        ));
      }
    } catch (e) {
      emit(state.copyWith(loadAllProductStatus: LoadStatus.failure));
    }
  }

  Future<void> getByCategory({
    String? categoryName,
  }) async {
    emit(state.copyWith(loadAllProductStatus: LoadStatus.loading));
    try {
      final result = await productRepository.getProductByCategory(
        categoryName: categoryName,
      );
      if (result.isNotEmpty) {
        emit(state.copyWith(
          products: result,
          loadAllProductStatus: LoadStatus.success,
        ));
      }
    } catch (e) {
      emit(state.copyWith(loadAllProductStatus: LoadStatus.failure));
    }
  }
}
