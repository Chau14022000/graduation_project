import '../../../injection/injector.dart';
import '../../repositories/auth_preferences_repository.dart';
import '../use_case.dart';

class ClearAuthPreferencesUseCase implements FutureOutputUseCase<void> {
  @override
  Future<void>  run() => injector.get<AuthPreferencesRepository>().clearAll();
}
