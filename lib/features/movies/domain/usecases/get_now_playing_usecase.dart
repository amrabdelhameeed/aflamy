import '../../data/models/movies_response_model.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/base_movies_repository.dart';
import 'base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetNowPlayingUseCase extends BaseUseCase<MoviesResponseModel, int> {
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MoviesResponseModel>> call(int parameters) async {
    return await baseMoviesRepository.getNowPlaying(parameters);
  }
}
