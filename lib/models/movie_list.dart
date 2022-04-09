import 'package:movie_db_flutter/models/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieList {
  final int page;
  @JsonKey(name: 'results')
  final List<Movie> movies;

  MovieList({required this.page, required this.movies});

  factory MovieList.fromJson(Map<String, dynamic> json) =>
      _$MovieListFromJson(json);
  Map<String, dynamic> toJson() => _$MovieListToJson(this);
}
