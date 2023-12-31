import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

interface class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

interface class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}

sealed class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}