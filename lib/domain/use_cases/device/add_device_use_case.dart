import '../../../injection/injector.dart';
import '../../entities/my_home/home/device_response_entities.dart';
import '../../repositories/device_repository.dart';
import '../use_case.dart';

class AddDevicesUseCase implements FutureUseCase<DeviceResponseEntities, void> {
  @override
  Future<void> run(input) => injector.get<DeviceRepository>().addDevice(input);
}
