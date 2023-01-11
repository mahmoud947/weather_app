import 'package:weather_app/core/domain/data_state.dart';

abstract class BaseUseCase<In, Out> {
  Stream<DataState<Out>> call({required In input});
}

class EmptyUseCaseInput {}
