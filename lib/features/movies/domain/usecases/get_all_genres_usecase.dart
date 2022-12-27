import '../../../../core/errors/failure.dart';
import '../../data/models/genre_model.dart';
import '../repositories/base_movies_repository.dart';
import 'base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetAllGenresUseCase extends BaseUseCase<List<GenreModel>, NoParams> {
  final BaseMoviesRepository baseMoviesRepository;
  GetAllGenresUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<GenreModel>>> call(NoParams parameters) async {
    return await baseMoviesRepository.getAllgenres();
  }
}
