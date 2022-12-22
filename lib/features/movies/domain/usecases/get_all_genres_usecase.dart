import 'package:aflamy/core/errors/failure.dart';
import 'package:aflamy/features/movies/data/models/genre_model.dart';
import 'package:aflamy/features/movies/domain/repositories/base_movies_repository.dart';
import 'package:aflamy/features/movies/domain/usecases/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetAllGenresUseCase extends BaseUseCase<List<GenreModel>, NoParams> {
  final BaseMoviesRepository baseMoviesRepository;
  GetAllGenresUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<GenreModel>>> call(NoParams parameters) async {
    return await baseMoviesRepository.getAllgenres();
  }
}
