import 'package:project_structure/service/network/api/server_error.dart';

class BaseModel<T> {
  T? data;
  ApiError? _error;
  bool? tokernExpired = false;

  setData(T data) {
    this.data = data;
  }

  setTokenExpired(bool value) {
    tokernExpired = value;
  }

  get getException => _error?.getErrorMessage();

  setException(ApiError error) {
    _error = error;
  }
}
