import '../entities/my_home/home/device_entities.dart';
import '../entities/my_home/home/device_response_entities.dart';
import '../entities/my_home/routines/routines_request_entities.dart';

abstract class DeviceRepository {
  Stream<DeviceEntities?> streamDevices(String id);

  Future<void> updateStateDevice(
    DeviceEntities deviceEntities,
  );

  Future<void> upTimerDevice(RoutinesRequestEntities routinesEntities);

  Future<DeviceEntities?> getDevice(String id);

  Future<void> addDevice(DeviceResponseEntities deviceResponseEntities);
}
