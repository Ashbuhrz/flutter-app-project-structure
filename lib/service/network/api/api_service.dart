import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:project_structure/screen/signin/signin.dart';
import 'package:project_structure/service/network/api/base_model.dart';
import 'package:project_structure/service/network/api/network_interceptor.dart';
import 'package:project_structure/service/network/api/server_error.dart';
import 'package:project_structure/util/constant.dart';

class ApiService {
  static final _dio = d.Dio();
  ApiService() {
    //initialize dio here  check to be called evertime while acessing its lazysingleton

    _dio.options = d.BaseOptions(
        baseUrl: AppConstant.baseURL,
        connectTimeout: 30000,
        receiveTimeout: 30000,
        validateStatus: (status) => status! < 500);
    _dio..interceptors.add(NetworkInterceptor());
  }

  d.Dio initDio() {
    String? token = 'AppConstant.storageToken.readFromKey()';
    return _dio
      ..options.headers = {
        "Authorization": (token != null) ? "Bearer $token" : ""
      };
  }

// all our api call here

  // Future<BaseModel<RegisterEntity>> register(RegisterRequestEntity data) =>
  //     initDio().post(RequestKeys.register, data: data.toJson()).parse();

// api call ends here
}

extension ApiHelper<T> on Future<d.Response<T>> {
  Future<BaseModel<T>> parse<T>() async {
    d.Response response;
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.mobile &&
          connectivityResult != ConnectivityResult.wifi) {
        return BaseModel()..setException(ApiError.withError(error: null));
      }

      response = await this;
      switch (response.statusCode) {
        case 200:
        case 300:
          if (response.data['data'] != null)
            return BaseModel();
          //  Use DartBeanAction plugin of anroid studio to build modle of json it will provide thi below method
          // return BaseModel()..setData(JsonConvert.fromJsonAsT(response.data));
          else
            return BaseModel()
              ..setException(
                  ApiError.withApiError('${response.data['message']}'));

        case 406:
          //token expired
          return BaseModel()
            ..setTokenExpired(true)
            ..setException(
                ApiError.withApiError("Session Expired, Please login again"));

        case 404:
          return BaseModel()
            ..setException(ApiError.withApiError(
                "Error occurred while Communication with Server, please try again"));

        case 500:
          return BaseModel()
            ..setException(ApiError.withApiError(
                "Error occurred while Communication with Server, please try again"));

        default:
          return BaseModel()
            ..setException(
                ApiError.withApiError("${response.data['message']}"));
      }

      // case 400:

    } catch (e) {
      return BaseModel()..setException(ApiError.withError(error: e));
    }
  }
}

extension DisplayError<T> on Future<BaseModel<T>> {
  Future<T?> display() async {
    var data = await this;
    if (data.data != null)
      return data.data;
    else {
      Get.snackbar(
        'Error',
        '${data.getException}',
      );

      if (data.tokernExpired!) Get.offAll(SignIn());
      return null;
    }
  }
}
