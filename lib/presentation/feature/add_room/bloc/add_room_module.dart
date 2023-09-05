import '../../../../../injection/injector.dart';
import '../../../../domain/use_cases/room/add_room_use_case.dart';
import 'add_room_presenter.dart';

class AddRoomModule {
  static Future<void> inject() async {
    injector.registerFactory<AddRoomPresenter>(
      () => AddRoomPresenter(
        injector.get<AddRoomUseCase>(),
      ),
    );
  }
}
