import 'package:aflamy/core/errors/failure.dart';
import 'package:aflamy/features/movies/data/models/genre_model.dart';
import 'package:aflamy/features/movies/data/models/now_playing_response_model.dart';
import 'package:aflamy/features/movies/domain/entites/now_playing_response.dart';
import 'package:aflamy/features/movies/domain/repositories/base_movies_repository.dart';
import 'package:aflamy/features/movies/domain/usecases/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieModel, int> {
  final BaseMoviesRepository baseMoviesRepository;
  GetMovieDetailsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MovieModel>> call(int parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}
