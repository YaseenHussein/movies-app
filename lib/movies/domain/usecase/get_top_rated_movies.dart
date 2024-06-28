import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_repository.dart';

class GetTopRatedMovies extends BaseUseCase<List<Movie>,NoParameter> {
  BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMovies(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameter) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
