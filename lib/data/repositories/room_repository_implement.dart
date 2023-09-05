import '../../domain/entities/my_home/home/room_entities.dart';
import '../../domain/repositories/room_repository.dart';
import '../services/network_services/realtime_service.dart';

class RoomRepositoryImplement implements RoomRepository {
  RoomRepositoryImplement(
    this._realtimeService,
  );

  final RealtimeService _realtimeService;

  @override
  Future<void> addRoom(
    RoomEntities roomEntities,
  ) async {
    await _realtimeService.addRoom(
      roomEntities.toRoomModel(),
    );
  }

  @override
  Future<void> removeRoom(String id) async {
    await _realtimeService.removeRoom(id);
  }

    @override
  Future<void> updateRoom(
    RoomEntities roomEntities,
  ) async {
    await _realtimeService.updateRoom(
      roomEntities.toRoomModel(),
    );
  }
}
