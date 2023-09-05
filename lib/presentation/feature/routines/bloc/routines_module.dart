import '../../../../../../domain/use_cases/user/get_account_use_case.dart';
import '../../../../../../injection/injector.dart';
import '../../../../domain/use_cases/routines/remove_routine_use_case.dart';
import '../../../../domain/use_cases/routines/stream_routines_user_case.dart';
import '../../../../domain/use_cases/routines/update_state_routines_use_case.dart';
import 'routines_presenter.dart';

class RoutinesModule {
  static Future<void> inject() async {
    injector.registerFactory<RoutinesPresenter>(
      () => RoutinesPresenter(
        injector.get<GetAccountUseCase>(),
        injector.get<UpdateStateRoutinesUseCase>(),
        injector.get<RemoveRoutinesUseCase>(),
        injector.get<StreamRoutinesUseCase>(),
      ),
    );
  }
}
