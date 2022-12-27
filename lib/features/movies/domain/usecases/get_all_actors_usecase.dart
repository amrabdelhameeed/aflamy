import '../../../../core/errors/failure.dart';
import '../../data/models/actor_model.dart';
import '../repositories/base_movies_repository.dart';
import 'base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetAllActorsUseCase extends BaseUseCase<List<ActorModel>, int> {
  final BaseMoviesRepository baseMoviesRepository;
  GetAllActorsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<ActorModel>>> call(int parameters) async {
    return await baseMoviesRepository.getAllActors(parameters);
  }
}
