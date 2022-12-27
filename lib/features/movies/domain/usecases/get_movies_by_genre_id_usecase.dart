import '../../../../core/errors/failure.dart';
import '../entites/now_playing_response.dart';
import '../repositories/base_movies_repository.dart';
import 'base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetMoviesByGenreIdUsecase extends BaseUseCase<MoviesResponse, int> {
  final BaseMoviesRepository baseMoviesRepository;
  GetMoviesByGenreIdUsecase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MoviesResponse>> call(int parameters) async {
    return await baseMoviesRepository.getMoviesByGenreId(parameters);
  }
}
