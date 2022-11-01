import 'package:equatable/equatable.dart';
import 'package:shop_demo_app/models/entities/product/product_entity.dart';
import 'package:shop_demo_app/models/enums/load_status.dart';

class MainState extends Equatable {
  final LoadStatus loadCategoriesStatus;
  final LoadStatus loadAllProductStatus;
  final List<String> categories;
  final List<ProductEntity> products;
  final int categorySelected;

  const MainState({
    this.loadAllProductStatus = LoadStatus.initial,
    this.loadCategoriesStatus = LoadStatus.initial,
    this.categories = const ['all'],
    this.products = const [],
    this.categorySelected = 0,
  });

  MainState copyWith({
    LoadStatus? loadCategoriesStatus,
    LoadStatus? loadAllProductStatus,
    List<String>? categories,
    List<ProductEntity>? products,
    int? categorySelected,
  }) {
    return MainState(
      loadCategoriesStatus: loadCategoriesStatus ?? this.loadCategoriesStatus,
      loadAllProductStatus: loadAllProductStatus ?? this.loadAllProductStatus,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      categorySelected: categorySelected ?? this.categorySelected,
    );
  }

  @override
  List<Object?> get props => [
        loadAllProductStatus,
        loadCategoriesStatus,
        categories,
        products,
        categorySelected,
      ];
}
