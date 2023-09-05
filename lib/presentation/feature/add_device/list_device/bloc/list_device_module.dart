import '../../../../../injection/injector.dart';
import 'list_device_presenter.dart';

class ListDeviceModule {
  static Future<void> inject() async {
    injector.registerFactory<ListDevicePresenter>(
      () => ListDevicePresenter(),
    );
  }
}
