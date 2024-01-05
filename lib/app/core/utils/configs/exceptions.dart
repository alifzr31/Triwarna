import 'package:dio/dio.dart';

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r, Response<dynamic>? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return '${response?.data}';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r, Response<dynamic>? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return '${response?.data}';
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r, Response<dynamic>? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return '${response?.data}';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r, Response<dynamic>? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return requestOptions.data;
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r, Response<dynamic>? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return '${response?.data}';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r, Response<dynamic>? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return '${response?.data}';
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions r, Response<dynamic>? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return '${response?.data}';
  }
}

class BadCertException extends DioException {
  BadCertException(RequestOptions r, Response<dynamic>? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return '${response?.data}';
  }
}

class SomeOtherException implements Exception {
  final RequestOptions requestOptions;
  final Response? response;

  SomeOtherException(this.requestOptions, this.response);

  @override
  String toString() {
    return 'SomeOtherException: An unknown exception occurred.\nRequest Options: $requestOptions\nResponse: $response';
  }
}
