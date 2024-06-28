import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/entities/movies_detail.dart';
import 'package:movies/movies/domain/entities/recommendations.dart';
import 'package:movies/movies/domain/usecase/get_recommendations_use_case.dart';

import '../../../core/error/failure.dart';
import '../usecase/get_movies_details_use_case.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MoviesDetail>> getMovieDetails(
      MoviesParameterDetails parameter);
  Future<Either<Failure, List<Recommendations>>> getRecommendationsMovies(
      RecommendationsParameter parameter);
}
