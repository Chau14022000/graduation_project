import '../../../injection/injector.dart';
import '../../entities/user/login/login_request_entities.dart';
import '../../entities/user/user_response_entities.dart';
import '../../repositories/user_repository.dart';
import '../use_case.dart';

class LoginUseCase
    implements FutureUseCase<LoginRequestEntities, UserResponseEntities?> {
  @override
  Future<UserResponseEntities?> run(input) =>
      injector.get<UserRepository>().login(input);
}
