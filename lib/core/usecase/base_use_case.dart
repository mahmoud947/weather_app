import 'use_case_state.dart';

abstract class BaseUseCase<In, Out> {
  Future<UseCaseState<Out>> call({required In input});
}

class EmptyUseCaseInput {}
