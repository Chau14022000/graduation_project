import '../../../injection/injector.dart';
import '../../entities/user/register/register_request_entities.dart';
import '../../entities/user/user_response_entities.dart';
import '../../repositories/user_repository.dart';
import '../use_case.dart';

class RegisterUseCase
    implements FutureUseCase<RegisterRequestEntities, UserResponseEntities?> {
  @override
  Future<UserResponseEntities?> run(input) =>
      injector.get<UserRepository>().register(input);
}
