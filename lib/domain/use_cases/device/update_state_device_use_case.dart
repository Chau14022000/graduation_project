import '../../../injection/injector.dart';
import '../../entities/my_home/home/device_entities.dart';
import '../../repositories/device_repository.dart';
import '../use_case.dart';

class UpdateStateDeviceUseCase implements FutureUseCase<DeviceEntities, void> {
  @override
  Future<void> run(DeviceEntities input) async {
    await injector.get<DeviceRepository>().updateStateDevice(input);
  }
}
