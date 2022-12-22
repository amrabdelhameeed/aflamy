import 'package:aflamy/core/errors/error_model.dart';

class ServerExceptions implements Exception {
  final ErrorModel errorModel;

  const ServerExceptions({required this.errorModel});
}

class LocalDatabaseExceptions implements Exception {
  final String message;

  const LocalDatabaseExceptions({required this.message});
}
