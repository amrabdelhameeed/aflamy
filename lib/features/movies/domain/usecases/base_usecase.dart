import '../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParams extends Equatable {
  const NoParams();
  @override
  List<Object?> get props => [];
}
