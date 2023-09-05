import '../entities/my_home/home/room_entities.dart';

abstract class RoomRepository {
  Future<void> addRoom(RoomEntities roomEntities);
  Future<void> updateRoom(RoomEntities roomEntities);
  Future<void> removeRoom(String id);

}
