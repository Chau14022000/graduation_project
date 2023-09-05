import '../../../../../injection/injector.dart';
import '../../../../domain/use_cases/user/login_use_case.dart';
import '../../../../domain/use_cases/user/save_access_token_use_case.dart';
import 'login_presenter.dart';

class LoginModule {
  static Future<void> inject() async {
    injector.registerLazySingleton<LoginPresenter>(
      () => LoginPresenter(
        injector.get<LoginUseCase>(),
        injector.get<SaveAccessTokenUseCase>(),
      ),
    );
  }
}
