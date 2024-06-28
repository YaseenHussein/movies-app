import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies/movies/data/repository/movies_repository.dart';
import 'package:movies/movies/domain/repository/base_repository.dart';
import 'package:movies/movies/domain/usecase/get_now_playing.dart';
import 'package:movies/movies/domain/usecase/get_top_rated_movies.dart';
import 'package:movies/movies/presentation/controller/movies_event.dart';
import 'package:movies/movies/presentation/controller/movies_state.dart';

import '../../../core/usecase/base_usecase.dart';
import '../../domain/usecase/get_popular_movies.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  GetNowPlayingMovies getNowPlayingMovies;
  GetPopularMovies getPopularMovies;
  GetTopRatedMovies getTopRatedMovies;
  MoviesBloc(
      this.getNowPlayingMovies, this.getPopularMovies, this.getTopRatedMovies)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMovies(const NoParameter());
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingMessage: l.message,
          nowPlayingState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMovies(const NoParameter());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularMoviesMessage: l.message,
          popularMoviesState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMovies: r,
          popularMoviesState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMovies(const NoParameter());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedMoviesMessage: l.message,
          topRatedMoviesState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedMoviesState: RequestState.loaded,
        ),
      ),
    );
  }
}
