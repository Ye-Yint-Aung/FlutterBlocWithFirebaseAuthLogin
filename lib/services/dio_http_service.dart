import 'package:bloc_base/services/response_status.dart';
import 'package:dio/dio.dart';


class DioHttpService {
  late final Dio _dio;

  BaseOptions get _baseOptions => BaseOptions();
  final String BASE_URL = "https://jsonplaceholder.typicode.com/";

  DioHttpService() {
    _initDio();
  }

  _initDio() {
    _dio = Dio(_baseOptions);
  }

  Future<ResponseObj> get(
      {required String endUrl,
        Map<String, dynamic>? params,
        Object? body}) async {
    ResponseObj responseObj = ResponseObj();
    final response =
    await _dio.get(BASE_URL + endUrl, queryParameters: params, data: body);
    responseObj.apiStatus = ApiStatus.loading;
    if (response.statusCode == 200) {
      responseObj.apiStatus = ApiStatus.success;
      responseObj.data = response.data;
      print("Response data in dio : ${responseObj.data.runtimeType}");
      return responseObj;
    } else {
      responseObj.apiStatus = ApiStatus.failure;
      //responseObj.errorStatus = ErrorStatus.unknown;
      return responseObj;
    }
    // return responseObj;
  }
}