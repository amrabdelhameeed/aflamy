import 'package:equatable/equatable.dart';

class Actor extends Equatable {
  final String? name;
  final String? profilePath;
  final String? character;
  const Actor(
    this.name,
    this.profilePath,
    this.character,
  );
  @override
  List<Object?> get props => [name, profilePath, character];
}
