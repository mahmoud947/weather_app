import 'package:get_it/get_it.dart';
import 'package:weather_app/core/network/network_helper.dart';
import 'package:weather_app/core/platform/network_connection_helper.dart';

final ls = GetIt.instance;

Future<void> initAppModule() async {
  //? ...init NetworkHelper
  ls.registerLazySingleton<NetworkHelper>(() {
    return NetworkHelperBuilder()
        .setBaseUrl('http://api.weatherapi.com')
        .addQueryInterceptor(
      {'key': '2d1c06112751427d8b6164714221811'},
    ).build();
  });

  //? ...init NetworkInfoHelper
  ls.registerLazySingleton<NetworkInfoHelper>(() => NetworkInfoHelperImpl());
}
