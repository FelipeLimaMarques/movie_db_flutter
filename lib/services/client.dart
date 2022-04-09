import 'package:movie_db_flutter/models/movie_list.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/movie/popular')
  Future<MovieList> getMovies(@Query('api_key') String apiKey);
}
