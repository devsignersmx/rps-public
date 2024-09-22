import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message, [this.exception]);
  final String message;
  final Exception? exception;

  @override
  List<Object?> get props => [message];
}

class SupaBaseException extends Failure {
  const SupaBaseException(super.message);
}

class Error extends Failure {
  const Error(Exception exception) : super('Error', exception);
}