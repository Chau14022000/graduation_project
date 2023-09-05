import '../../../injection/injector.dart';
import '../../entities/my_home/routines/routines_request_entities.dart';
import '../../repositories/device_repository.dart';
import '../use_case.dart';

class UpTimerDeviceUseCase
    implements FutureUseCase<RoutinesRequestEntities, void> {
  @override
  Future<void> run(RoutinesRequestEntities input) async {
    await injector.get<DeviceRepository>().upTimerDevice(input);
  }
}
