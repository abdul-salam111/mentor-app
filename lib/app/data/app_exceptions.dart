class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);
  String toString() {
    return '$_prefix $_message';
  }
}

class FetchDataExceptions extends AppException {
  FetchDataExceptions([String? message])
      : super(message, 'Error during communication');
}

class BadRequestExceptions extends AppException {
  BadRequestExceptions([String? message])
      : super(message, '');
}
class UnAuthorizeExceptions extends AppException {
  UnAuthorizeExceptions([String? message])
      : super(message, '');
}
class InvalidExceptions extends AppException {
  InvalidExceptions([String? message])
      : super(message, 'Invalid Input');
}
