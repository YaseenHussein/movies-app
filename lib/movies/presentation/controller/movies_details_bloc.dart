import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/domain/usecase/get_movies_details_use_case.dart';
import 'package:movies/movies/domain/usecase/get_recommendations_use_case.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entities/movies_detail.dart';
import '../../domain/entities/recommendations.dart';

part 'movies_details_events.dart';
part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  GetMoviesDetailsUseCase getMoviesDetailsUseCase;
  GetRecommendationsMoviesUseCase getRecommendationsMoviesUseCase;
  MoviesDetailsBloc(
      this.getMoviesDetailsUseCase, this.getRecommendationsMoviesUseCase)
      : super(const MoviesDetailsState()) {
    on<GetMoviesDetailEvent>(_getMoviesDetails);
    on<GetMoviesRecommendationsEvent>(_getMoviesRecommendations);
  }

  FutureOr<void> _getMoviesDetails(
      GetMoviesDetailEvent event, Emitter<MoviesDetailsState> emit) async {
    final result =
        await getMoviesDetailsUseCase(MoviesParameterDetails(moveId: event.id));
    result.fold(
      (l) => emit(state.copyWith(
        movieDetailsMessage: l.message,
        moviesDetailState: RequestState.error,
      )),
      (r) => emit(
        state.copyWith(
          moviesDetail: r,
          moviesDetailState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getMoviesRecommendations(GetMoviesRecommendationsEvent event,
      Emitter<MoviesDetailsState> emit) async {
    final result = await getRecommendationsMoviesUseCase(
        RecommendationsParameter(event.id));
    result.fold(
      (l) => emit(state.copyWith(
        recommendationsMessage: l.message,
        recommendationsState: RequestState.error,
      )),
      (r) => emit(
        state.copyWith(
          recommendations: r,
          moviesDetailState: RequestState.loaded,
        ),
      ),
    );
  }
}
