import 'package:core/base/base_service.dart';
import 'package:dio/dio.dart';

class HttpInterceptors extends BaseServiceModel with Interceptor{
  @override
  DioError onError(DioError err, ErrorInterceptorHandler handler) {
    log!.e(err.response!.statusMessage!,'${err.response!.realUri.path} ${err.response!.statusCode!}', err.stackTrace);
    throw Exception(err.response!.statusMessage!);
  }

  @override
  Future<dynamic> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
    log!.i("${options.uri}",'${options.data}');
    return options;
  }

}