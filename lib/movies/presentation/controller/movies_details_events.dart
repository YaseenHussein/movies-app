part of 'movies_details_bloc.dart';

abstract class MoviesDetailsEvent extends Equatable {
  const MoviesDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMoviesDetailEvent extends MoviesDetailsEvent {
  final int id;

  const GetMoviesDetailEvent(this.id);
  @override
  List<Object> get props => [id];
}

class GetMoviesRecommendationsEvent extends MoviesDetailsEvent {
  final int id;

  const GetMoviesRecommendationsEvent(this.id);
  @override
  List<Object> get props => [id];
}
