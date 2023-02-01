import 'package:dio/dio.dart';

import '../../core/constants/app_strings.dart';
import 'api_failure.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError,
}

class ApiException implements Exception {
  late ApiFailure failure;

  ApiException.handle(dynamic error) {
    if (error is DioError) {
      // dio error so its error from response of the API
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.defaultError.getFailure();
    }
  }

  ApiFailure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return DataSource.connectTimeout.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case ResponseCode.badRequest:
            return DataSource.badRequest.getFailure();
          case ResponseCode.forbidden:
            return DataSource.forbidden.getFailure();
          case ResponseCode.unauthorised:
            return DataSource.unauthorised.getFailure();
          case ResponseCode.notFound:
            return DataSource.notFound.getFailure();
          case ResponseCode.internalServerError:
            return DataSource.internalServerError.getFailure();
          default:
            //   return DataSource.DEFAULT.getFailure();
            return _getResponseError(error);
        }
      case DioErrorType.cancel:
        return DataSource.cancel.getFailure();
      case DioErrorType.other:
        return DataSource.defaultError.getFailure();
    }
  }

  ApiFailure _getResponseError(DioError error) {
    try {
      int code = error.response!.statusCode!;
      String message = error.response!.data!['message'];
      Map errorMessage = error.response!.data!;
      return ApiFailure(code, message, errorMessage);
    } on Exception {
      return DataSource.defaultError.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  ApiFailure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return ApiFailure(ResponseCode.badRequest, ResponseMessage.badRequest,
            ResponseMessage.badRequest);
      case DataSource.forbidden:
        return ApiFailure(ResponseCode.forbidden, ResponseMessage.forbidden,
            ResponseMessage.forbidden);
      case DataSource.unauthorised:
        return ApiFailure(ResponseCode.unauthorised,
            ResponseMessage.unauthorised, ResponseMessage.unauthorised);
      case DataSource.notFound:
        return ApiFailure(ResponseCode.notFound, ResponseMessage.notFound,
            ResponseMessage.notFound);
      case DataSource.internalServerError:
        return ApiFailure(
            ResponseCode.internalServerError,
            ResponseMessage.internalServerError,
            ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return ApiFailure(ResponseCode.connectTimeout,
            ResponseMessage.connectTimeout, ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return ApiFailure(ResponseCode.cancel, ResponseMessage.cancel,
            ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return ApiFailure(ResponseCode.receiveTimeout,
            ResponseMessage.receiveTimeout, ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return ApiFailure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout,
            ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return ApiFailure(ResponseCode.cacheError, ResponseMessage.cacheError,
            ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return ApiFailure(
            ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataSource.defaultError:
        return ApiFailure(ResponseCode.defaultError,
            ResponseMessage.defaultError, ResponseMessage.defaultError);
      default:
        return ApiFailure(ResponseCode.defaultError,
            ResponseMessage.defaultError, ResponseMessage.defaultError);
    }
  }
}

class ResponseCode {
  // API status codes
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no content
  static const int badRequest = 400; // failure, api rejected the request
  static const int forbidden = 403; // failure, api rejected the request
  static const int unauthorised = 401; // failure user is not authorised
  static const int notFound =
      404; // failure, api url is not correct and not found
  static const int authFailed =
      422; // failure, api url is not correct and not found
  static const int internalServerError =
      500; // failure, crash happened in server side

  // local status code
  static const int defaultError = -1;
  static const int connectTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
}

class ResponseMessage {
  // API status codes
  // API response codes
  //static const String success = AppStrings.success; // success with data
  static const String noContent =
      AppStrings.noContent; // success with no content
  static const String badRequest =
      AppStrings.badRequestError; // failure, api rejected our request
  static const String forbidden =
      AppStrings.forbiddenError; // failure,  api rejected our request
  static const String unauthorised =
      AppStrings.unauthorizedError; // failure, user is not authorised
  static const String notFound = AppStrings
      .notFoundError; // failure, API url is not correct and not found in api side.
  static const String internalServerError =
      AppStrings.internalServerError; // failure, a crash happened in API side.

  // local responses codes
  static const String defaultError =
      AppStrings.defaultError; // unknown error happened
  static const String connectTimeout =
      AppStrings.timeoutError; // issue in connectivity
  static const String cancel =
      AppStrings.defaultError; // API request was cancelled
  static const String receiveTimeout =
      AppStrings.timeoutError; //  issue in connectivity
  static const String sendTimeout =
      AppStrings.timeoutError; //  issue in connectivity
  static const String cacheError = AppStrings
      .defaultError; //  issue in getting data from local data source (cache)
  static const String noInternetConnection =
      AppStrings.noInternetError; // issue in connectivity
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
