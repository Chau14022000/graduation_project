import '../../../../injection/injector.dart';
import 'my_home_presenter.dart';

class MyHomeModule {
  static Future<void> inject() async {
    injector.registerFactory<MyHomePresenter>(
      () => MyHomePresenter(),
    );
  }
}
