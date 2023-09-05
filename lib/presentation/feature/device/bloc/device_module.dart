import '../../../../../injection/injector.dart';
import '../../../../domain/use_cases/device/stream_device_use_case.dart';
import '../../../../domain/use_cases/device/update_state_device_use_case.dart';
import '../../../../domain/use_cases/room/update_room_use_case.dart';
import '../../../../domain/use_cases/user/get_account_use_case.dart';
import 'device_presenter.dart';

class DeviceModule {
  static Future<void> inject() async {
    injector.registerFactory<DevicePresenter>(
      () => DevicePresenter(
        injector.get<StreamDeviceUseCase>(),
        injector.get<UpdateStateDeviceUseCase>(),
        injector.get<GetAccountUseCase>(),
        injector.get<UpdateRoomUseCase>(),
      ),
    );
  }
}
