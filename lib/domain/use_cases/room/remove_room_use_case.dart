import '../../../injection/injector.dart';
import '../../repositories/room_repository.dart';
import '../use_case.dart';

class RemoveRoomUseCase implements FutureUseCase<String, void> {
  @override
  Future<void> run(String input) async {
    await injector.get<RoomRepository>().removeRoom(input);
  }
}
