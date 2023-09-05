import '../../../../../injection/injector.dart';
import '../../../../domain/use_cases/device/get_device_use_case.dart';
import '../../../../domain/use_cases/device/up_timer_device_use_case.dart';
import '../../../../domain/use_cases/routines/save_routines_use_case.dart';
import '../../../../domain/use_cases/routines/update_routine_use_case.dart';
import 'create_routines_presenter.dart';

class CreateRoutinesModule {
  static Future<void> inject() async {
    injector.registerFactory<CreateRoutinesPresenter>(
      () => CreateRoutinesPresenter(
        injector.get<SaveRoutinesUseCase>(),
        injector.get<UpTimerDeviceUseCase>(),
        injector.get<GetDevicesUseCase>(),
        injector.get<UpdateRoutinesUseCase>(),
      ),
    );
  }
}
