import 'package:weather_app/core/domain/data_state.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/usecase/base_use_case.dart';
import 'package:weather_app/core/usecase/use_case_state.dart';
import 'package:weather_app/features/weather/domain/models/weather.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class GetForecastUseCase implements BaseUseCase<EmptyUseCaseInput?, Weather> {
  GetForecastUseCase({required this.repository});

  final WeatherRepository repository;

  @override
  Future<UseCaseState<Weather>> call({EmptyUseCaseInput? input}) async {
    try {
      final weather = await repository.getForecast();
      return Right<Weather>(data: weather);
    } on RemoteException catch (e) {
      return Left<Weather>(failure: RemoteFailure(message: e.message));
    } on PlatformException catch (e) {
      return Left<Weather>(failure: PlatformFailure(message: e.message));
    } on Exception {
      return Left<Weather>(
          failure: RemoteFailure(message: 'Unknown exception'));
    }
  }
}
