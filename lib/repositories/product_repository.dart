import 'package:shop_demo_app/models/entities/product/product_entity.dart';
import 'package:shop_demo_app/network/api_client.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProductList();

  Future<List<ProductEntity>> getProductByCategory({
    String? categoryName,
  });

  Future<List<String>> getAllCategories();
}

class ProductRepositoryImpl extends ProductRepository {
  final ApiClient apiClient;

  ProductRepositoryImpl({
    required this.apiClient,
  });

  @override
  Future<List<ProductEntity>> getProductList() async {
    final result = await apiClient.getAllProduct();
    return result;
  }

  @override
  Future<List<String>> getAllCategories() async {
    final result = await apiClient.getAllCategories();
    return result;
  }

  @override
  Future<List<ProductEntity>> getProductByCategory({
    String? categoryName,
  }) async {
    final result = await apiClient.getProductsByCategory(
      categoryName: categoryName,
    );
    return result;
  }
}
