import '../../../injection/injector.dart';
import '../../entities/user/user_entities.dart';
import '../../repositories/user_repository.dart';
import '../use_case.dart';

class GetAccountUseCase implements FutureOutputUseCase<UserEntities> {
  @override
  Future<UserEntities> run() => injector.get<UserRepository>().getAccount();
}
