import '../../../../../injection/injector.dart';
import '../../../../domain/use_cases/device/stream_device_use_case.dart';
import '../../../../domain/use_cases/device/update_state_device_use_case.dart';
import 'room_presenter.dart';

class RoomModule {
  static Future<void> inject() async {
    injector.registerFactory<RoomPresenter>(
      () => RoomPresenter(
        injector.get<UpdateStateDeviceUseCase>(),
        injector.get<StreamDeviceUseCase>(),
      ),
    );
  }
}
