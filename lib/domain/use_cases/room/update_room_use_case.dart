import '../../../injection/injector.dart';
import '../../entities/my_home/home/room_entities.dart';
import '../../repositories/room_repository.dart';
import '../use_case.dart';

class UpdateRoomUseCase implements FutureUseCase<RoomEntities, void> {
  @override
  Future<void> run(RoomEntities input) async {
    await injector.get<RoomRepository>().updateRoom(input);
  }
}
