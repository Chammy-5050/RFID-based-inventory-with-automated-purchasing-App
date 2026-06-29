


import 'package:dio/dio.dart';

class ApiClient {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.pub.dev',
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
  ));

}
