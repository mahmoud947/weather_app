import 'dart:io';

class NetworkHelper<T> {
  // builder design pattern
  NetworkHelper({
    required this.builder,
  })  : _httpClient = builder._httpClient,
        _baseUrl = builder._baseUrl,
        _queryInterceptor = builder._queryInterceptor,
        _timeOut = builder._timeOut;

  final HttpClient _httpClient;
  final NetworkHelperBuilder builder;
  final String? _baseUrl;
  final Map<String, dynamic>? _queryInterceptor;
  final Duration? _timeOut;

  // return json object
  Future<HttpClientResponse> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    // check if _queryInterceptor and add it to _queryInterceptor
    if (_queryInterceptor != null) {
      queryParameters?.addAll(_queryInterceptor!);
    }

    Uri uri = Uri.https(
      _baseUrl?.replaceAll('http://', '') ?? path,
      path,
      // add queryParameters to all request
      queryParameters ?? _queryInterceptor,
    );
    return await _httpClient
        .getUrl(uri)
        .then((req) => req.close())
        .timeout(_timeOut ?? const Duration(seconds: 15));
  }
}

// builder design pattern
class NetworkHelperBuilder {
  final HttpClient _httpClient = HttpClient();
  String? _baseUrl;
  Map<String, dynamic>? _queryInterceptor;
  Duration? _timeOut;
  NetworkHelperBuilder();

  NetworkHelperBuilder setBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
    return this;
  }

  NetworkHelperBuilder setTimeOut(Duration timeOut) {
    _timeOut = timeOut;
    return this;
  }

  NetworkHelperBuilder addQueryInterceptor(
    Map<String, dynamic> queryInterceptor,
  ) {
    _queryInterceptor = queryInterceptor;
    return this;
  }

  NetworkHelper build() => NetworkHelper(builder: this);
}
