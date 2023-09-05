import '../../../../../injection/injector.dart';
import 'handle_connect_presenter.dart';

class HandleConnectModule {
  static Future<void> inject() async {
    injector.registerLazySingleton<HandleConnectPresenter>(
      () => HandleConnectPresenter(),
    );
  }
}
