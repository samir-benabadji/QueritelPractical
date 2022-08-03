import 'package:dio/dio.dart';

class RestAPI {
  String get serverIP {
    return "https://mocki.io";
  }

  Dio dio = new Dio();
  Response? lastResponse;

  static const String _defaultContentType = "application/json";

  Future<Response?> myDioGET({
    required String url,
    Map<String, dynamic>? queryParameters,
    String contentType = _defaultContentType,
    bool isAuthEnabled = true,
  }) async {
    try {
      Response response;
      response = await dio.get(
        url,
        queryParameters: queryParameters,
      );

      lastResponse = response;
      return response;
    } on DioError catch (e) {
      handleError(e);
      lastResponse = e.response;
      return e.response;
    }
  }

  void handleError(DioError error) {
    switch (error.response!.statusCode) {
      case 403:
        print("You do not have the right privileges to access this resource.");
        break;
      case 422:
        print("The data you have provided is invalid.");
        break;
      case 401:
        print("Incorrect credentials.");
        break;
      case 404:
        print("Request not found.");
        break;
      case 500:
        print(
            "There is something wrong with our servers, please report to the admin so it gets fixed.");
        break;
      default:
        print("Something went wrong. status code =" +
            error.response!.statusCode.toString());
    }
  }
}
