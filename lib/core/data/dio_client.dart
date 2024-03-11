import 'package:comicvine/core/data/api_constants.dart';
import 'package:dio/dio.dart';

class DioClient {
  static final Dio _dio = Dio();
  static void configureDio() {
    // _dio.options.baseUrl = apiBaseComicVin;

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final uri = Uri.parse('${options.baseUrl}${options.path}')
            .replace(queryParameters: options.queryParameters);
        // print("Sending request to URL: $uri");

        handler.next(options);
      },
      onResponse: (response, handler) {
        // print('Response: ${response.data}');

        handler.next(response);
      },
      onError: (DioException e, handler) {
        print('Error: ${e.message}');
        if (e.response != null) {
          print('Error response data: ${e.response!.data}');
          print('Error response headers: ${e.response!.headers}');
        } else {
          print('Error request: ${e.requestOptions}');
          print('Error type: ${e.type}');
        }
        handler.next(e);
      },
    ));
  }

  static Future<Response?> httpGet(
      String path, Map<String, String> queryParams) async {
    final String targetUrl = '$apiBaseComicVin$path';

    try {
      // Asegúrate de incluir los parámetros de consulta y ajustar la URL
      final resp = await _dio.get(
        '$proxyUrl$targetUrl',
        queryParameters: queryParams,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      return resp;
    } catch (e) {
      print(e);
      print('Error en el get');
      return null;
    }
  }

  static Future<Response> post(String path, Map<String, dynamic> data) async {
    try {
      final resp = await _dio.post(path, data: data);
      print(resp);
      return resp;
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.badResponse) {
          if (e.response!.statusCode == 401) {
            return e.response!;
          } else if (e.response!.statusCode == 500) {}
        }
      }
      throw 'Error en el post';
    }
  }
}
