import 'package:dio/dio.dart';
import 'package:shop_demo_app/models/entities/product/product_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/products')
  Future<List<ProductEntity>> getAllProduct();

  @GET('/products/categories')
  Future<List<String>> getAllCategories();

  @GET('/products/category/{category_name}')
  Future<List<ProductEntity>> getProductsByCategory({
    @Path('category_name') String? categoryName,
  });
}
