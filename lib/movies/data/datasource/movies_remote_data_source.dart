import 'package:dio/dio.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/network/api_constance.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/movies/data/model/movie_details_model.dart';
import 'package:movies/movies/data/model/movie_model.dart';
import 'package:movies/movies/data/model/recommendations_model.dart';
import 'package:movies/movies/domain/usecase/get_movies_details_use_case.dart';
import 'package:movies/movies/domain/usecase/get_recommendations_use_case.dart';

abstract class BaseRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMoviesDetail(MoviesParameterDetails parameter);
  Future<List<RecommendationsModel>> getReRecommendationsMovies(
      RecommendationsParameter parameter);
}

class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map(
          (e) => MoviesModel.fromJson(e),
        ),
      );
    } else {
      print("not Data");
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map(
          (e) => MoviesModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map(
          (e) => MoviesModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMoviesDetail(
      MoviesParameterDetails parameter) async {
    final response =
        await Dio().get(ApiConstance.moviesDetailsPath(parameter.moveId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationsModel>> getReRecommendationsMovies(
      RecommendationsParameter parameter) async {
    final response =
        await Dio().get(ApiConstance.recommendationsMoviesPath(parameter.id));
    if (response.statusCode == 200) {
      return List<RecommendationsModel>.from(
        (response.data['results'] as List).map(
          (e) => RecommendationsModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }
}
