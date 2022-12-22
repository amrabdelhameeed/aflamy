import 'package:aflamy/features/movies/domain/entites/actor.dart';

class ActorModel extends Actor {
  const ActorModel(super.name, super.profilePath, super.character);
  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      json['name'],
      json['profile_path'],
      json['character'],
    );
  }
}
