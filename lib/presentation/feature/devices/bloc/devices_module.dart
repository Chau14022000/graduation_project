import '../../../../../../domain/use_cases/user/get_account_use_case.dart';
import '../../../../../../injection/injector.dart';
import '../../../../domain/use_cases/device/get_device_use_case.dart';
import 'devices_presenter.dart';

class DevicesModule {
  static Future<void> inject() async {
    injector.registerFactory<DevicesPresenter>(
      () => DevicesPresenter(
        injector.get<GetAccountUseCase>(),
        injector.get<GetDevicesUseCase>(),
      ),
    );
  }
}
