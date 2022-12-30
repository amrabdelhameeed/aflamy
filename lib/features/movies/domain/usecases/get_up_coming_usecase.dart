import '../../data/models/movies_response_model.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/base_movies_repository.dart';
import 'base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetUpComingUseCase extends BaseUseCase<MoviesResponseModel, int> {
  final BaseMoviesRepository baseMoviesRepository;
  GetUpComingUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MoviesResponseModel>> call(int parameters) async {
    return await baseMoviesRepository.getUpComing(parameters);
  }
}
