import 'dart:io';

class ApiError implements Exception {
  String _errorMessage = '';

  ApiError.withError({dynamic? error}) {
    _handleError(error);
  }

  ApiError.withApiError(String error) {
    _errorMessage = error;
  }
  String getErrorMessage() => _errorMessage;

  _handleError(Exception? error) {
    if (error is HttpException) {
      _errorMessage = "Unexpected internal server error.";
    } else if (error is FormatException) {
      _errorMessage = "Unexpected internal server error.";
    } else if (error is SocketException) {
      _errorMessage = "Unexpected internal server error.";
    } else {
      _errorMessage =
          "Make sure that mobile data or Wi-Fi is turn on, then try again";
    }
    return _errorMessage;
  }
}
