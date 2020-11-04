import 'package:dio/dio.dart';
import 'package:motobuy/shared/shared_data.dart';

class SharedService {
  static var dio = Dio();

  static void setDio() {
    BaseOptions options = BaseOptions(
      baseUrl: SharedData.serverUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = Dio(options);
  }
}
