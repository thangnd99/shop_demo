import 'package:shop_demo_app/configs/app_configs.dart';
import 'package:shop_demo_app/models/entities/movie_entity.dart';
import 'package:shop_demo_app/models/response/array_response.dart';
import 'package:shop_demo_app/network/api_client.dart';

abstract class MovieRepository {
  Future<ArrayResponse<MovieEntity>> getMovies({required int page});

  Future<MovieEntity> getMovie(int id);
}

class MovieRepositoryImpl extends MovieRepository {
  ApiClient apiClient;

  MovieRepositoryImpl({required this.apiClient});

  @override
  Future<MovieEntity> getMovie(int id) {
    // TODO: implement getMovie
    throw UnimplementedError();
  }

  @override
  Future<ArrayResponse<MovieEntity>> getMovies({required int page}) async {
    return apiClient.getMovies(MovieAPIConfig.apiKey, page);
  }
}
