

import 'package:bloc_base/services/response_status.dart';

abstract class HttpService{
  Future<ResponseObj> get({required String endUrl,Map<String,dynamic>? params});
// Future<Map<String,String?>> header();
}