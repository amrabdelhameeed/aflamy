import 'package:aflamy/core/errors/failure.dart';
import 'package:aflamy/features/movies/data/models/actor_model.dart';
import 'package:aflamy/features/movies/data/models/genre_model.dart';
import 'package:aflamy/features/movies/domain/repositories/base_movies_repository.dart';
import 'package:aflamy/features/movies/domain/usecases/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetAllActorsUseCase extends BaseUseCase<List<ActorModel>, int> {
  final BaseMoviesRepository baseMoviesRepository;
  GetAllActorsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<ActorModel>>> call(int parameters) async {
    return await baseMoviesRepository.getAllActors(parameters);
  }
}
