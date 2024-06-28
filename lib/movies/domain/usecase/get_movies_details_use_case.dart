import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entities/movies_detail.dart';
import 'package:movies/movies/domain/repository/base_repository.dart';

class GetMoviesDetailsUseCase
    extends BaseUseCase<MoviesDetail, MoviesParameterDetails> {
  BaseMoviesRepository baseMoviesRepository;
  GetMoviesDetailsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MoviesDetail>> call(
      MoviesParameterDetails parameter) async {
    return await baseMoviesRepository.getMovieDetails(parameter);
  }
  
}

class MoviesParameterDetails extends Equatable {
  final int moveId;

  const MoviesParameterDetails({required this.moveId});
  @override
  List<Object?> get props => [
        id,
      ];
}
//if we want to enter more the one parameter to our Use case Function we Will use this class[MoviesParameterDetails]
//this class make us add more parameter to call function :)