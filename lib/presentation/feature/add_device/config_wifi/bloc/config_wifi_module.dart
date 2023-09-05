import '../../../../../injection/injector.dart';
import 'config_wifi_presenter.dart';

class ConfigWifiModule {
  static Future<void> inject() async {
    injector.registerLazySingleton<ConfigWifiPresenter>(
      () => ConfigWifiPresenter(),
    );
  }
}
