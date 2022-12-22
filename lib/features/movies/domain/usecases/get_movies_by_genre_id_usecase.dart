import 'package:aflamy/core/errors/failure.dart';
import 'package:aflamy/features/movies/data/models/genre_model.dart';
import 'package:aflamy/features/movies/domain/entites/now_playing_response.dart';
import 'package:aflamy/features/movies/domain/repositories/base_movies_repository.dart';
import 'package:aflamy/features/movies/domain/usecases/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetMoviesByGenreIdUsecase extends BaseUseCase<MoviesResponse, int> {
  final BaseMoviesRepository baseMoviesRepository;
  GetMoviesByGenreIdUsecase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MoviesResponse>> call(int parameters) async {
    return await baseMoviesRepository.getMoviesByGenreId(parameters);
  }
}
