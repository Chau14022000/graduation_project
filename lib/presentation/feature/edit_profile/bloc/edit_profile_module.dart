import '../../../../../injection/injector.dart';
import '../../../../domain/use_cases/user/get_account_use_case.dart';
import '../../../../domain/use_cases/user/up_image_use_case.dart';
import '../../../../domain/use_cases/user/update_account_use_case.dart';
import 'edit_profile_presenter.dart';

class EditProfileModule {
  static Future<void> inject() async {
    injector.registerFactory<EditProfilePresenter>(
      () => EditProfilePresenter(
        injector.get<GetAccountUseCase>(),
        injector.get<UpImageUseCase>(),
        injector.get<UpdateAccountUseCase>(),
      ),
    );
  }
}
