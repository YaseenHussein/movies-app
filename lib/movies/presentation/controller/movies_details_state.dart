part of 'movies_details_bloc.dart';

class MoviesDetailsState extends Equatable {
  final MoviesDetail? moviesDetail;
  final RequestState moviesDetailState;
  final String movieDetailsMessage;
  final List<Recommendations> recommendations;
  final RequestState recommendationsState;
  final String recommendationsMessage;

  const MoviesDetailsState({
    this.moviesDetail,
    this.moviesDetailState = RequestState.loading,
    this.movieDetailsMessage = "",
    this.recommendations = const [],
    this.recommendationsState = RequestState.loading,
    this.recommendationsMessage = "",
  });
  MoviesDetailsState copyWith({
    MoviesDetail? moviesDetail,
    RequestState? moviesDetailState,
    String? movieDetailsMessage,
    List<Recommendations>? recommendations,
    RequestState? recommendationsState,
    String? recommendationsMessage,
  }) {
    return MoviesDetailsState(
      moviesDetail: moviesDetail ?? this.moviesDetail,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      moviesDetailState: moviesDetailState ?? this.moviesDetailState,
      recommendations: recommendations ?? this.recommendations,
      recommendationsMessage:
          recommendationsMessage ?? this.recommendationsMessage,
      recommendationsState: recommendationsState ?? this.recommendationsState,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        moviesDetail,
        moviesDetailState,
        movieDetailsMessage,
        recommendationsMessage,
        recommendations,
        recommendationsState,
      ];
}
