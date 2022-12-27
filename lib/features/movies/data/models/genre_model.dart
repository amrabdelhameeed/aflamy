import '../../domain/entites/genre.dart';

class GenreModel extends Genre {
  GenreModel(super.id, super.name);
  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      json["id"],
      json["name"],
    );
  }
}
