// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

class NetworkHelper<T> {
  // builder design pattern
  NetworkHelper({
    required this.builder,
  })  : _httpClient = builder._httpClient,
        _baseUrl = builder._baseUrl,
        _queryInterceptor = builder._queryInterceptor;

  final HttpClient _httpClient;
  final NetworkHelperBuilder builder;
  final String? _baseUrl;
  final Map<String, dynamic>? _queryInterceptor;

  // return json object
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    // check if _queryInterceptor and add it to _queryInterceptor
    if (_queryInterceptor != null) {
      queryParameters?.addAll(_queryInterceptor!);
    }

    Uri uri = Uri.https(
      _baseUrl?.replaceAll('https://', '') ?? path,
      path,
      // add queryParameters to all request
      queryParameters ?? _queryInterceptor,
    );
    return await _httpClient
        .getUrl(uri)
        .then((req) => req.close())
        .then((res) => res.transform(utf8.decoder).join())
        .then((jsonString) => json.decode(jsonString));
  }
}

// builder design pattern
class NetworkHelperBuilder {
  final HttpClient _httpClient = HttpClient();
  String? _baseUrl;
  Map<String, dynamic>? _queryInterceptor;

  NetworkHelperBuilder();

  NetworkHelperBuilder setBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
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
