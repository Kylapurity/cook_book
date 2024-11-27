import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart'; // Correct import path for http_interceptor
import 'package:cookbook/services/http_interceptor.dart';

class WebClient {
  static const String url = 'http://themealdb.com/api/json/v1/';
  static const String apiKey = '1/';
  static const String searchRequest = 'search.php?s=';

  // Creating the client with LoggingInterceptor
  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
    requestTimeout: const Duration(seconds: 5),
  );
}
