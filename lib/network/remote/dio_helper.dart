import 'package:dio/dio.dart';
import 'package:virtual_hospital_ward_app/shared/constants.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppEndPoints.baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return await dio!.get(
        url,
        queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    String? token,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
