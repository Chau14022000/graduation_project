import '../../../injection/injector.dart';
import '../../entities/user/user_entities.dart';
import '../../repositories/user_repository.dart';
import '../use_case.dart';

class UpdateAccountUseCase implements FutureUseCase<UserEntities, void> {
  @override
  Future<void> run(input) =>
      injector.get<UserRepository>().updateAccount(input);
}
