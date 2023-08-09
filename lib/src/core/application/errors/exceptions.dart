class AppException implements Exception {
  final Object? error;
  final String? message;

  AppException({this.error, this.message});
}

class DatabaseException extends AppException { }

class NotEnoughMoneyException extends DatabaseException { }

class AdLoadingFailed extends AppException { }