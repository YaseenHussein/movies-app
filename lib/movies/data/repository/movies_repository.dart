import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/data/model/recommendations_model.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/entities/movies_detail.dart';
import 'package:movies/movies/domain/entities/recommendations.dart';
import 'package:movies/movies/domain/repository/base_repository.dart';
import 'package:movies/movies/domain/usecase/get_recommendations_use_case.dart';

import '../../domain/usecase/get_movies_details_use_case.dart';
import '../datasource/movies_remote_data_source.dart';

class MoviesRepository extends BaseMoviesRepository {
  BaseRemoteDataSource baseRemoteDataSource;
  MoviesRepository(this.baseRemoteDataSource);
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (error) {
      return left(ServerFailure(error.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesDetail>> getMovieDetails(
      MoviesParameterDetails parameter) async {
    final result = await baseRemoteDataSource.getMoviesDetail(parameter);
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getRecommendationsMovies(
      RecommendationsParameter parameter) async {
    final result =
        await baseRemoteDataSource.getReRecommendationsMovies(parameter);
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMassageModel.statusMessage));
    }
  }
}
