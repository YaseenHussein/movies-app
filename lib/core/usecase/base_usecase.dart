import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameter);
}

class NoParameter extends Equatable {
  const NoParameter();
  @override
  List<Object?> get props => [];
}
