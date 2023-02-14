import '../constants/imports.dart';

class ApiRepo {
  final DioClient _dioClient = DioClient();

  Future FetchData() async {
    try {
      final response = await _dioClient.getData(EndPoints.baseUrl);
      //  print(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
