import '../../data/models/movies_response_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/base_movies_repository.dart';
import 'base_usecase.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieModel, int> {
  final BaseMoviesRepository baseMoviesRepository;
  GetMovieDetailsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MovieModel>> call(int parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}
