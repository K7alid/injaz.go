import 'package:dio/dio.dart';

class DioHelper {
  //this function which I created
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://41.65.69.179:8085/token',
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

  //////////////////////////////////////////////////

  /*
  // static Dio dio = Dio(BaseOptions(baseUrl: Constants.baseURL));

  var dio = Dio()
    //..options.baseUrl = Constants.baseURL
    ..httpClientAdapter = Http2Adapter(
      ConnectionManager(idleTimeout: 30000),
    );
  var deviceType;
  var appVersion;
  DioHelper() {
    initializeInterceptors();
  }

  postData({path, data, token, query, context}) async {
    Response response;
    try {
      if (token != null) {
        dio.options.headers = {
          'authorization': 'Bearer $token',
          'user-agent': 'GenieCustomerApp/$deviceType/$appVersion',
        };
      } else if (context != null) {
        dio.options.headers = {
          'user-agent': 'GenieCustomerApp/$deviceType/$appVersion',
        };
      }

      response = await dio.post(
        path,
        data: data,
        queryParameters: query,
      );
      return response.data;
    } on SocketException catch (e) {
      print(e);
    } on HttpException catch (e) {
      print("Couldn't find the Data 😱");
    } on DioError catch (e) {
      print(e);
      print(e.message);
      //print(e.request);

      if (e.error is SocketException) {
        print("====== No Internet Connection 😑 ======= ");
        return {
          "success": false,
          "exception": "Internet",
          "data": "No Internet Connection"
        };
      }
      if (e.error is HttpException) {
        print("====== 500 HTTP Exception 😑 ======= ");
        return {
          "success": false,
          "exception": "HttpException",
          "data": e.message
        };
      }
      ConnectionService connectionService = ConnectionService();
      bool isInternerFound = await connectionService.isInternet();
      print(isInternerFound);
      return isInternerFound == false
          ? {
              "success": false,
              "exception": "Internet",
              "data": "No Internet Connection"
            }
          : e.response?.data;
    } on FormatException catch (e) {
      print("Bad response format 👎");
    } on Exception catch (e) {
      print("General Exception in Dio Helper");
      print(e.toString());
    }
  }

  postDataHttpforAdd({path, data, token, query, context}) async {
    http.Response response;
    try {
      response = await http.post(path, body: data, headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "Authorization": "Bearer $token",
        'user-agent': 'GenieCustomerApp/$deviceType/$appVersion',
      });
      print(response);
      var parsed = json.decode(response.body);

      return parsed;
    } on SocketException catch (e) {
      print(e);
    } on HttpException catch (e) {
      print("Couldn't find the Data 😱");
    } on DioError catch (e) {
      print(e);
      print(e.message);
      //print(e.request);

      if (e.error is SocketException) {
        print("====== No Internet Connection 😑 ======= ");
        return {
          "success": false,
          "exception": "Internet",
          "data": "No Internet Connection"
        };
      }
      if (e.error is HttpException) {
        print("====== 500 HTTP Exception 😑 ======= ");
        return {
          "success": false,
          "exception": "HttpException",
          "data": e.message
        };
      }
      ConnectionService connectionService = ConnectionService();
      bool isInternetFound = await connectionService.isInternet();
      print(isInternetFound);
      return isInternetFound == false
          ? {
              "success": false,
              "exception": "Internet",
              "data": "No Internet Connection"
            }
          : e.response?.data;
    } on FormatException catch (e) {
      print("Bad response format 👎");
    } on Exception catch (e) {
      print("General Exception in Dio Helper");
      print(e.toString());
    }
  }

  postDataHttp({path, data, token, query, context}) async {
    Response response;
    try {
      response = (await http.post(path, body: json.encode(data), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "Authorization": "Bearer $token",
        'user-agent': 'GenieCustomerApp/$deviceType/$appVersion',
      })) as Response;
      print(response);
      //var parsed = json.decode(response.body);

      //return parsed;
    } on SocketException catch (e) {
      print(e);
    } on HttpException catch (e) {
      print("Couldn't find the Data 😱");
    } on DioError catch (e) {
      print(e);
      print(e.message);
      // print(e.request);
      print(e.requestOptions);

      if (e.error is SocketException) {
        print("====== No Internet Connection 😑 ======= ");
        return {
          "success": false,
          "exception": "Internet",
          "data": "No Internet Connection"
        };
      }
      if (e.error is HttpException) {
        print("====== 500 HTTP Exception 😑 ======= ");
        return {
          "success": false,
          "exception": "HttpException",
          "data": e.message
        };
      }
      ConnectionService connectionService = ConnectionService();
      bool isInternetFound = await connectionService.isInternet();
      print(isInternetFound);
      return isInternetFound == false
          ? {
              "success": false,
              "exception": "Internet",
              "data": "No Internet Connection"
            }
          : e.response?.data;
    } on FormatException catch (e) {
      print("Bad response format 👎");
    } on Exception catch (e) {
      print("General Exception in Dio Helper");
      print(e.toString());
    }
  }

  patchDataHttpForCredit({path, data, token, query, context}) async {
    Response response;
    try {
      response = (await http.patch(path, body: data, headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "Authorization": "Bearer $token",
        'user-agent': 'GenieCustomerApp/$deviceType/$appVersion',
      })) as Response;
      print(response);
      //var parsed = json.decode(response.body);

      //return parsed;
    } on SocketException catch (e) {
      print(e);
    } on HttpException catch (e) {
      print("Couldn't find the Data 😱");
      print(e.message);
    } on DioError catch (e) {
      print(e);
      if (e.error is SocketException) {
        print("====== No Internet Connection 😑 ======= ");
        return {
          "success": false,
          "exception": "Internet",
          "data": "No Internet Connection"
        };
      }
      ConnectionService connectionService = ConnectionService();
      bool isInternetFound = await connectionService.isInternet();
      print(isInternetFound);
      return isInternetFound == false
          ? {
              "success": false,
              "exception": "Internet",
              "data": "No Internet Connection"
            }
          : e.response?.data;
    } on FormatException catch (e) {
      print("Bad response format 👎");
    } on Exception catch (e) {
      print("General Exception in Dio Helper");
      print(e.toString());
    }
  }

  patchDataHttp({path, data, token, query, context}) async {
    Response response;
    try {
      response = (await http.patch(path, body: json.encode(data), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "Authorization": "Bearer $token",
        'user-agent': 'GenieCustomerApp/$deviceType/$appVersion',
      })) as Response;
      print(response);
      //var parsed = json.decode(response.body);

      //return parsed;
    } on SocketException catch (e) {
      print(e);
    } on HttpException catch (e) {
      print("Couldn't find the Data 😱");
      print(e.message);
    } on DioError catch (e) {
      print(e);
      if (e.error is SocketException) {
        print("====== No Internet Connection 😑 ======= ");
        return {
          "success": false,
          "exception": "Internet",
          "data": "No Internet Connection"
        };
      }
      ConnectionService connectionService = ConnectionService();
      bool isInternetFound = await connectionService.isInternet();
      print(isInternetFound);
      return isInternetFound == false
          ? {
              "success": false,
              "exception": "Internet",
              "data": "No Internet Connection"
            }
          : e.response?.data;
    } on FormatException catch (e) {
      print("Bad response format 👎");
    } on Exception catch (e) {
      print("General Exception in Dio Helper");
      print(e.toString());
    }
  }

  patchData({path, data, token, query, context}) async {
    Response response;
    try {
      if (token != null) {
        dio.options.headers = {
          'authorization': 'Bearer $token',
          'user-agent': 'GenieCustomerApp/$deviceType/$appVersion',
        };
      } else {
        dio.options.headers = {
          'user-agent': 'GenieCustomerApp/$deviceType/$appVersion',
        };
      }
      response = await dio.patch(
        path,
        data: data,
        queryParameters: query,
      );
      return response.data;
    } on SocketException catch (e) {
      print(e);
    } on HttpException catch (e) {
      print("Couldn't find the Data 😱");
      print(e.message);
    } on DioError catch (e) {
      print(e);
      if (e.error is SocketException) {
        print("====== No Internet Connection 😑 ======= ");
        return {
          "success": false,
          "exception": "Internet",
          "data": "No Internet Connection"
        };
      }
      ConnectionService connectionService = ConnectionService();
      bool isInternetFound = await connectionService.isInternet();
      print(isInternetFound);
      return isInternetFound == false
          ? {
              "success": false,
              "exception": "Internet",
              "data": "No Internet Connection"
            }
          : e.response?.data;
    } on FormatException catch (e) {
      print("Bad response format 👎");
    } on Exception catch (e) {
      print("General Exception in Dio Helper");
      print(e.toString());
    }
  }

  deleteDataHttp({path, data, token, query, context}) async {
    Response response;
    try {
      response = (await http.delete(path, headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "Authorization": "Bearer $token",
        'user-agent': 'GenieCustomerApp/$deviceType/$appVersion',
      })) as Response;
      //var parsed = json.decode(response.body);

      //return parsed;
    } on SocketException catch (e) {
      print(e);
    } on HttpException catch (e) {
      print("Couldn't find the Data 😱");
      print(e.message);
    } on DioError catch (e) {
      print(e);
      if (e.error is SocketException) {
        print("====== No Internet Connection 😑 ======= ");
        return {
          "success": false,
          "exception": "Internet",
          "data": "No Internet Connection"
        };
      }
      ConnectionService connectionService = ConnectionService();
      bool isInternetFound = await connectionService.isInternet();
      print(isInternetFound);
      return isInternetFound == false
          ? {
              "success": false,
              "exception": "Internet",
              "data": "No Internet Connection"
            }
          : e.response?.data;
    } on FormatException catch (e) {
      print("Bad response format 👎");
    } on Exception catch (e) {
      print("General Exception in Dio Helper");
      print(e.toString());
    }
  }

  deleteData({path, data, token, query, context}) async {
    Response response;
    try {
      if (token != null) {
        dio.options.headers = {
          'authorization': 'Bearer $token',
          'user-agent': 'GenieCustomerApp/$deviceType/$appVersion',
        };
      } else {
        dio.options.headers = {
          'user-agent': 'GenieCustomerApp/$deviceType/$appVersion',
        };
      }
      response = await dio.delete(
        path,
        data: data,
        queryParameters: query,
      );
      return response.data;
    } on SocketException catch (e) {
      print(e);
    } on HttpException catch (e) {
      print("Couldn't find the Data 😱");
      print(e.message);
    } on DioError catch (e) {
      print(e);
      if (e.error is SocketException) {
        print("====== No Internet Connection 😑 ======= ");
        return {
          "success": false,
          "exception": "Internet",
          "data": "No Internet Connection"
        };
      }
      ConnectionService connectionService = ConnectionService();
      bool isInternerFound = await connectionService.isInternet();
      print(isInternerFound);
      return isInternerFound == false
          ? {
              "success": false,
              "exception": "Internet",
              "data": "No Internet Connection"
            }
          : e.response?.data;
    } on FormatException catch (e) {
      print("Bad response format 👎");
    } on Exception catch (e) {
      print("General Exception in Dio Helper");
      print(e.toString());
    }
  }

  /*Future<String> getDataserviceHttp({path, token, query, context}) async {
    Response response;
    try {
      var response = await http.get(path, headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "Authorization": "Bearer $token",
        'user-agent': 'GenieCustomerApp/$deviceType/$appVersion',
      });

      var parsed = response.body;
      print(parsed);
      print(response.statusCode);

      print(parsed.toString());
      String data = parsed.toString();
      return data;
    } on SocketException catch (e) {
      print(e);
    } on HttpException catch (e) {
      print("Couldn't find the Data 😱");
    } on DioError catch (e) {
      print(e.message);
      if (e.error is SocketException) {
        print("====== No Internet Connection 😑 ======= ");
        return {
          "success": false,
          "exception": "Internet",
          "data": "No Internet Connection"
        }.toString();
      }
      if (e.error is HttpException) {
        print("====== 500 HTTP Exception 😑 ======= ");
        return {
          "success": false,
          "exception": "HttpException",
          "data": e.message ?? "HttpException: Http status error [500]"
        }.toString();
      }
      ConnectionService connectionService = ConnectionService();
      bool isInternerFound = await connectionService.isInternet();
      print(isInternerFound);
      return isInternerFound == false
          ? {
              "success": false,
              "exception": "Internet",
              "data": "No Internet Connection"
            }
          : e.response?.data;
      // return e.response.data;
    } on FormatException catch (e) {
      print("Bad response format 👎");
    } on Exception catch (e) {
      print("General Exception in Dio Helper");
      print(e.toString());
    }
  }*/

  // Future<String> getDataservice({path, token, query, context}) async {
  //   // if (context != null) {
  //   //   deviceType = AppCubit.get(context).deviceType;
  //   //   appVersion = AppCubit.get(context).appVersion;
  //   // } else {
  //   //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   //   appVersion = packageInfo.version;
  //   //   DeviceInfo deviceInfo = DeviceInfo();
  //   //   deviceInfo.initPlatformState().then((value) {
  //   //     deviceType = deviceInfo.deviceData['deviceType'];
  //   //   });
  //   // }
  //
  //   Response response;
  //   try {
  //     if (token != null) {
  //       dio.options.headers = {
  //         'authorization': 'Bearer $token',
  //         'user-agent': 'GenieCustomerApp/$deviceType/$appVersion',
  //       };
  //     } else {
  //       dio.options.headers = {
  //         'user-agent': 'GenieCustomerApp/$deviceType/$appVersion',
  //       };
  //     }
  //     Stopwatch stopwatch = Stopwatch()..start();
  //     response = await dio.get(path,
  //         queryParameters: query,
  //         options: Options(
  //           validateStatus: (status) {
  //             return status! < 500;
  //           },
  //           /*extra: RetryOptions(
  //             retryInterval: const Duration(seconds: 1),
  //           ).toExtra(),*/
  //         ));
  //     print(response.toString());
  //     String data = response.toString();
  //     print('api() executed in ${stopwatch.elapsed}');
  //     return data;
  //   } on SocketException catch (e) {
  //     print(e);
  //   } on HttpException catch (e) {
  //     print("Couldn't find the Data 😱");
  //   } on DioError catch (e) {
  //     print(e.message);
  //     if (e.error is SocketException) {
  //       print("====== No Internet Connection 😑 ======= ");
  //       return {
  //         "success": false,
  //         "exception": "Internet",
  //         "data": "No Internet Connection"
  //       }.toString();
  //     }
  //     if (e.error is HttpException) {
  //       print("====== 500 HTTP Exception 😑 ======= ");
  //       return {
  //         "success": false,
  //         "exception": "HttpException",
  //         "data": e.message ?? "HttpException: Http status error [500]"
  //       }.toString();
  //     }
  //     ConnectionService connectionService = ConnectionService();
  //     bool isInternetFound = await connectionService.isInternet();
  //     print(isInternetFound);
  //     return isInternetFound == false
  //         ? {
  //             "success": false,
  //             "exception": "Internet",
  //             "data": "No Internet Connection"
  //           }
  //         : e.response?.data;
  //     // return e.response.data;
  //   } on FormatException catch (e) {
  //     print("Bad response format 👎");
  //   } on Exception catch (e) {
  //     print("General Exception in Dio Helper");
  //     print(e.toString());
  //   }
  // }

  getData({path, token, query, context}) async {
    Response response;
    try {
      if (token != null) {
        dio.options.headers = {
          'authorization': 'Bearer $token',
          'user-agent': 'GenieCustomerApp/$deviceType/$appVersion',
        };
      } else {
        dio.options.headers = {
          'user-agent': 'GenieCustomerApp/$deviceType/$appVersion',
        };
      }
      Stopwatch stopwatch = Stopwatch()..start();
      response = await dio.get(path, queryParameters: query, options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
        /*extra: RetryOptions(
              retryInterval: const Duration(seconds: 10),
            ).toExtra(),*/
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
        return {
          "success": false,
          "exception": "Internet",
          "data": "No Internet Connection"
        };
      }
      if (e.error is HttpException) {
        print("====== 500 HTTP Exception 😑 ======= ");
        return {
          "success": false,
          "exception": "HttpException",
          "data": e.message
        };
      }
      ConnectionService connectionService = ConnectionService();
      bool isInternetFound = await connectionService.isInternet();
      print(isInternetFound);
      return isInternetFound == false
          ? {
              "success": false,
              "exception": "Internet",
              "data": "No Internet Connection"
            }
          : e.response?.data;
      // return e.response.data;
    } on FormatException catch (e) {
      print("Bad response format 👎");
    } on Exception catch (e) {
      print("General Exception in Dio Helper");
      print(e.toString());
    }
  }

  initializeInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
          /*onError: (error) {
          print(error);
          if ((error?.response?.statusCode ?? 0) == 500) {
            throw HttpException(error.message);
          }
          // if (error.type == DioErrorType.RESPONSE) {
          //   print(error.message);
          // }
          String mainString = error.message.toString();
          String substring = "SocketException";
          if (mainString.contains(substring) == true) {
            throw SocketException(error.message);
          }
        },*/
          /*onRequest: (request) async {
          print(request);
          ConnectionService connectionService = ConnectionService();
          bool isInternerFound = await connectionService.isInternet();
          print(isInternerFound);
          if (isInternerFound == false) {
            print(isInternerFound);
            throw SocketException("No Internet Connection");
          }
        },
        onResponse: (response) async {
          ConnectionService connectionService = ConnectionService();
          bool isInternerFound = await connectionService.isInternet();
          print(isInternerFound);
          if (isInternerFound == false) {
            print(isInternerFound);
            throw SocketException("No Internet Connection");
          }
          print(response.data);
        },*/
          ),
    );
  }*/
}

/*
class Failure {
  final String message;
  Failure(this.message);

  @override
  String toString() => message;
}
*/
