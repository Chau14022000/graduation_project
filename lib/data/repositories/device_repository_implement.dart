import '../../domain/entities/my_home/home/device_entities.dart';
import '../../domain/entities/my_home/home/device_response_entities.dart';
import '../../domain/entities/my_home/routines/routines_request_entities.dart';
import '../../domain/repositories/device_repository.dart';
import '../models/device/device_model.dart';
import '../services/network_services/realtime_service.dart';

class DeviceRepositoryImplement implements DeviceRepository {
  DeviceRepositoryImplement(
    this._realtimeService,
  );

  final RealtimeService _realtimeService;

  @override
  Stream<DeviceEntities?> streamDevices(String id) {
    final stream = _realtimeService.streamDevices(id).map<DeviceModel?>(
      (event) {
        final map = event.snapshot.value;
        if (map != null) {
          return DeviceModel.fromJson(
            Map<String, dynamic>.from(map as Map<dynamic, dynamic>),
          );
        } else {
          return null;
        }
      },
    );
    return stream.map(
      (event) {
        if (event != null) {
          return event.toDeviceEntities();
        } else {
          return null;
        }
      },
    );
  }

  @override
  Future<void> updateStateDevice(
    DeviceEntities deviceEntities,
  ) async {
    await _realtimeService.updateStateDevice(
      DeviceModel(
        state: deviceEntities.state,
        token: deviceEntities.id,
        nameDevice: deviceEntities.nameDevice,
        connectWifi: deviceEntities.connectWifi,
        timer: deviceEntities.timer,
        timeWork: deviceEntities.timeWork,
      ),
    );
  }

  @override
  Future<void> upTimerDevice(RoutinesRequestEntities routinesEntities) async {
    await _realtimeService.upTimerDevice(
      routinesEntities.toRoutineRequestModel(),
      routinesEntities.routine.onOffDevice,
    );
  }

  @override
  Future<DeviceEntities?> getDevice(String id) async {
    final device = await _realtimeService.getDevice(id);
    if (device == null) {
      return null;
    }
    return device.toDeviceEntities();
  }

  @override
  Future<void> addDevice(DeviceResponseEntities deviceResponseEntities) async {
    await _realtimeService.addDevice(
      deviceResponseEntities.idDevice,
      deviceResponseEntities.room,
    );
  }
}
