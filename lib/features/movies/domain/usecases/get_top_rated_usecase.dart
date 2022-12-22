import 'package:aflamy/core/errors/failure.dart';
import 'package:aflamy/features/movies/data/models/now_playing_response_model.dart';
import 'package:aflamy/features/movies/domain/entites/now_playing_response.dart';
import 'package:aflamy/features/movies/domain/repositories/base_movies_repository.dart';
import 'package:aflamy/features/movies/domain/usecases/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetTopRatedUseCase extends BaseUseCase<MoviesResponse, NoParams> {
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MoviesResponseModel>> call(NoParams parameters) async {
    return await baseMoviesRepository.getTopRated();
  }
}
