import '../../../../../../domain/use_cases/user/clear_auth_preferences_use_case.dart';
import '../../../../../../domain/use_cases/user/get_account_use_case.dart';
import '../../../../../../injection/injector.dart';
import 'setting_presenter.dart';

class SettingModule {
  static Future<void> inject() async {
    injector.registerLazySingleton<SettingPresenter>(
      () => SettingPresenter(
        injector.get<ClearAuthPreferencesUseCase>(),
        injector.get<GetAccountUseCase>(),
      ),
    );
  }
}
