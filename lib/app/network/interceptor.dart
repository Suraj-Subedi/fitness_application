import 'package:dio/dio.dart';
import 'package:fitness_app/app/utils/memory_management.dart';

class Logging extends Interceptor {
  Dio dio = Dio();

  Logging({required this.dio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(
      ({
        "Authorization": "Bearer ${MemoryManagement.getAccessToken()}",
        "Connection": "keep-alive",
      }),
    );
    return super.onRequest(options, handler);
  }
}
