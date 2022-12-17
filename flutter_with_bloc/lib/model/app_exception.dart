abstract class AppException implements Exception {
  String? prefix;
  String? message;
  AppException([this.prefix, this.message]);
}

class FetchDataException extends AppException {
  FetchDataException({String? message})
      : super("Error during Commmunication: ", message);
}

class BadRequestException extends AppException {
  BadRequestException({String? message}) : super("Invalid Request: ", message);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException({String? message})
      : super("Unauthorised Request: ", message);
}

class InvalidInputException extends AppException {
  InvalidInputException({String? message}) : super("Invalid Input: ", message);
}
