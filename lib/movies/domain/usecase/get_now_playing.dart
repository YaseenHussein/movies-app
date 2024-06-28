import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/repository/base_repository.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetNowPlayingMovies extends BaseUseCase<List<Movie>,NoParameter> {
  BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMovies(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameter) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
