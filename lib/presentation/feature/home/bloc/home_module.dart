import '../../../../../../domain/use_cases/device/update_state_device_use_case.dart';
import '../../../../../../domain/use_cases/user/get_account_use_case.dart';
import '../../../../../../injection/injector.dart';
import '../../../../domain/use_cases/device/stream_device_use_case.dart';
import '../../../../domain/use_cases/room/remove_room_use_case.dart';
import 'home_presenter.dart';

class HomeModule {
  static Future<void> inject() async {
    injector.registerFactory<HomePresenter>(
      () => HomePresenter(
        injector.get<StreamDeviceUseCase>(),
        injector.get<GetAccountUseCase>(),
        injector.get<UpdateStateDeviceUseCase>(),
        injector.get<RemoveRoomUseCase>(),
      ),
    );
  }
}
