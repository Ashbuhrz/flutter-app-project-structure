import 'package:dio/dio.dart';

class NetworkInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    print('Response : ${response.toString()}');
    print('Status Code : ${response.statusCode}');
    print('Status message : ${response.statusMessage}');
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    print('path : ${options.path}');
    print('body : ${options.data.toString()}');
    print('headers : ${options.headers.toString()}');
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('error: ${err.message} ,  ');

    // switch (err.type) {
    //   case DioErrorType.connectTimeout:
    //     err.response?.data = BaseModel()
    //       ..setException(ApiError.withApiError("connection timeout"));
    //     break;
    //   case DioErrorType.cancel:
    //     err.response?.data = BaseModel()
    //       ..setException(ApiError.withApiError("somethin went wrong"));
    //     break;
    //   case DioErrorType.receiveTimeout:
    //     err.response?.data = BaseModel()
    //       ..setException(ApiError.withApiError("connection timeout"));
    //     break;
    //   case DioErrorType.sendTimeout:
    //     err.response?.data = BaseModel()
    //       ..setException(ApiError.withApiError("connection timeout"));
    //     break;
    //   case DioErrorType.response:
    //     break;
    //   case DioErrorType.other:
    //     break;
    // }
    handler.resolve(err.response!);
    super.onError(err, handler);
  }
}
