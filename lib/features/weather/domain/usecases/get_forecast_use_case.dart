import 'package:weather_app/core/domain/data_state.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/usecase/base_use_case.dart';
import 'package:weather_app/features/weather/domain/models/weather.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class GetForecastUseCase implements BaseUseCase<EmptyUseCaseInput?, Weather> {
  GetForecastUseCase({required this.repository});

  final WeatherRepository repository;

  @override
  Stream<DataState<Weather>> call({EmptyUseCaseInput? input}) async* {
    yield Loading<Weather>();
    try {
      final weather = await repository.getForecast();
      yield Successfully<Weather>(data: weather);
    } on RemoteException catch (e) {
      yield Error(message: e.message);
    } on PlatformException catch (e) {
      yield Error(message: e.message);
    } on Exception catch (e) {
      yield Error(message: e.toString());
    }
  }
}
