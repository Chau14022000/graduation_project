import '../../../injection/injector.dart';
import '../../repositories/auth_preferences_repository.dart';
import '../use_case.dart';

class GetAccessTokenUseCase implements OutputUseCase<String?> {
  @override
  String? run() => injector.get<AuthPreferencesRepository>().getAccessToken();
}
