import '../constants/imports.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient();

  //api get method

  Future<Response> getData(
    String url, {
    Map<String, dynamic>? queryParams,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? progressCallback,
  }) async {
    try {
      final Response response = await _dio.get(url,
          queryParameters: queryParams,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: progressCallback);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
