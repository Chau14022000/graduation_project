import '../../../injection/injector.dart';
import '../../repositories/auth_preferences_repository.dart';
import '../use_case.dart';

class SaveAccessTokenUseCase implements FutureUseCase<String, void> {
  @override
  Future<void> run(input) =>
      injector.get<AuthPreferencesRepository>().setAccessToken(input);
}
