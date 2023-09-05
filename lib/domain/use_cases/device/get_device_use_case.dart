import '../../../injection/injector.dart';
import '../../entities/my_home/home/device_entities.dart';
import '../../repositories/device_repository.dart';
import '../use_case.dart';

class GetDevicesUseCase implements FutureUseCase<String, DeviceEntities?> {
  @override
  Future<DeviceEntities?> run(input) =>
      injector.get<DeviceRepository>().getDevice(input);
}
