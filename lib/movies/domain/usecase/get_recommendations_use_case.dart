import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entities/recommendations.dart';
import 'package:movies/movies/domain/repository/base_repository.dart';

class GetRecommendationsMoviesUseCase
    extends BaseUseCase<List<Recommendations>, RecommendationsParameter> {
  BaseMoviesRepository baseMoviesRepository;
  GetRecommendationsMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendations>>> call(
      RecommendationsParameter parameter) async {
    return await baseMoviesRepository.getRecommendationsMovies(parameter);
  }
}

class RecommendationsParameter extends Equatable {
  final int id;

  const RecommendationsParameter(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
      ];
}
