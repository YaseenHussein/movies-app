import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies/movies/data/repository/movies_repository.dart';
import 'package:movies/movies/domain/repository/base_repository.dart';
import 'package:movies/movies/domain/usecase/get_movies_details_use_case.dart';
import 'package:movies/movies/domain/usecase/get_now_playing.dart';
import 'package:movies/movies/domain/usecase/get_popular_movies.dart';
import 'package:movies/movies/domain/usecase/get_top_rated_movies.dart';
import 'package:movies/movies/presentation/controller/movies_bloc.dart';
import 'package:movies/movies/presentation/controller/movies_details_bloc.dart';

import '../../movies/domain/usecase/get_recommendations_use_case.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void initial() {
    ///Bloc
    sl.registerFactory(() => MoviesBloc(sl<GetNowPlayingMovies>(),
        sl<GetPopularMovies>(), sl<GetTopRatedMovies>()));
    sl.registerFactory(() => MoviesDetailsBloc(
        sl<GetMoviesDetailsUseCase>(), sl<GetRecommendationsMoviesUseCase>()));
//هذا النوع من اجل انشا اكثر من كائن

    ///GetNowPlayingMovies
    sl.registerLazySingleton(() => GetNowPlayingMovies(sl()));

    ///GetPopularMovies
    sl.registerLazySingleton(() => GetPopularMovies(sl()));

    ///GetTopRatedMovies
    sl.registerLazySingleton(() => GetTopRatedMovies(sl()));

    ///GetMoviesDetailUseCase
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationsMoviesUseCase(sl()));

    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    ///DATA SOURCE
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  }
}
