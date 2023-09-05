import '../../../../../injection/injector.dart';
import '../../../../domain/use_cases/user/register_use_case.dart';
import 'register_presenter.dart';

class RegisterModule {
  static Future<void> inject() async {
    injector.registerFactory<RegisterPresenter>(
      () => RegisterPresenter(
        injector.get<RegisterUseCase>(),
      ),
    );
  }
}
