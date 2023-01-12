import 'package:weather_app/core/domain/data_state.dart';
import 'package:weather_app/core/usecase/use_case_state.dart';

abstract class BaseUseCase<In, Out> {
  Future<UseCaseState<Out>> call({required In input});
}

class EmptyUseCaseInput {}
