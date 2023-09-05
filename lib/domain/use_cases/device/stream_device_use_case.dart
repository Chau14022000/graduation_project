import '../../../injection/injector.dart';
import '../../entities/my_home/home/device_entities.dart';
import '../../repositories/device_repository.dart';
import '../use_case.dart';

class StreamDeviceUseCase implements StreamUseCase<String, DeviceEntities?> {
  @override
  Stream<DeviceEntities?> run(input) =>
      injector.get<DeviceRepository>().streamDevices(input);
}
