import '../../../../domain/use_cases/user/get_access_token_use_case.dart';
import '../../../../injection/injector.dart';
import 'splash_presenter.dart';

class SplashModule {
  static Future<void> inject() async {
    injector.registerLazySingleton<SplashPresenter>(
      () => SplashPresenter(
        injector.get<GetAccessTokenUseCase>(),
      ),
    );
  }
}
