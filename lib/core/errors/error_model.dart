import 'package:equatable/equatable.dart';
part 'error_model.g.dart';

class ErrorModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;
  const ErrorModel(this.statusCode, this.statusMessage, this.success);
  @override
  List<Object?> get props => [statusCode, statusMessage, success];
  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}
