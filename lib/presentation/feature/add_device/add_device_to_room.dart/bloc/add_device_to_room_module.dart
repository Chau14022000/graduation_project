import '../../../../../../injection/injector.dart';
import '../../../../../domain/use_cases/device/add_device_use_case.dart';
import '../../../../../domain/use_cases/user/get_account_use_case.dart';
import 'add_device_to_room_presenter.dart';

class AddDeviceToRoomModule {
  static Future<void> inject() async {
    injector.registerFactory<AddDeviceToRoomPresenter>(
      () => AddDeviceToRoomPresenter(
        injector.get<GetAccountUseCase>(),
        injector.get<AddDevicesUseCase>(),
      ),
    );
  }
}
