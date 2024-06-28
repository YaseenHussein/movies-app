import 'package:movies/movies/data/model/genres_model.dart';
import 'package:movies/movies/domain/entities/movies_detail.dart';

class MovieDetailsModel extends MoviesDetail {
  const MovieDetailsModel({
    required super.genres,
    required super.backdropPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        genres: List<GenresModel>.from(
            (json["genres"] as List).map((x) => GenresModel.fromJson(x))),
        backdropPath: json["backdrop_path"],
        id: json["id"],
        overview: json["overview"],
        releaseDate: json['release_date'],
        runtime: json["runtime"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
      );
}
