class GeneralException implements Exception {
  final String message;
  GeneralException({required this.message});

  @override
  String toString() => message;
}

class NoInternetException extends GeneralException {
  NoInternetException() : super(message: "No internet connection");
}

class PermissionDeniedException extends GeneralException {
  PermissionDeniedException() : super(message: "Permission denied");
}
