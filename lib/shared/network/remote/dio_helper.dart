import 'package:dio/dio.dart';
import 'package:injaz_go/shared/constants.dart';
import 'package:injaz_go/shared/network/local/cache_helper.dart';

class DioHelper {
  //this function which I created
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'bearer ${CacheHelper.getData(key: 'tok')}',
    };
    var response;
    response = await dio.get(
      url,
      queryParameters: query,
    );
    return response.data;
  }

  /*static Future<Response> getData({path, token, query}) async {
    Response response;
    dio.options.headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'bearer $token',
    };
    try {
      if (token != null) {
      } else {
        dio.options.headers = {
          //'user-agent': 'GenieCustomerApp/$deviceType/$appVersion',
        };
      }
      Stopwatch stopwatch = Stopwatch()..start();
      response = await dio.get(path, queryParameters: query, options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
        */ /*extra: RetryOptions(
              retryInterval: const Duration(seconds: 10),
            ).toExtra(),*/ /*
      ));
      print('api() executed in ${stopwatch.elapsed}');

      return response.data;
    } on SocketException catch (e) {
      print(e);
    } on HttpException catch (e) {
      print("Couldn't find the Data 😱");
    } on DioError catch (e) {
      print(e.message);
      if (e.error is SocketException) {
        print("====== No Internet Connection 😑 ======= ");
      }
      if (e.error is HttpException) {
        print("====== 500 HTTP Exception 😑 ======= ");
      }
    }
  }*/
}
