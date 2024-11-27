import 'dart:async'; // Import for FutureOr
import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor implements InterceptorContract {
  final Logger logger = Logger();

  /// Intercept and log request details
  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) async {
    logger.i("Intercepting Request...");
    logger.i("URL: ${request.url}");
    logger.i("Headers: ${request.headers}");
    if (request is Request) {
      logger.i("Body: ${request.body}");
    }

    return request;
  }

  /// Intercept and log response details
  @override
  FutureOr<BaseResponse> interceptResponse({required BaseResponse response}) async {
    logger.i("Intercepting Response...");
    logger.i("Status Code: ${response.statusCode}");
    logger.i("Headers: ${response.headers}");
    if (response is Response) {
      logger.i("Body: ${response.body}");
    }

    if (response.statusCode ~/ 100 != 2) {
      logger.e("Error response detected!");
    }

    return response;
  }

  /// Determine if requests should be intercepted
  @override
  FutureOr<bool> shouldInterceptRequest() {
    logger.i("Determining if requests should be intercepted.");
    // Intercept all requests
    return true;
  }

  /// Determine if responses should be intercepted
  @override
  FutureOr<bool> shouldInterceptResponse() {
    logger.i("Determining if responses should be intercepted.");
    // Intercept all responses
    return true;
  }
}