import '../../../injection/injector.dart';
import '../../repositories/user_repository.dart';
import '../use_case.dart';

class UpImageUseCase implements FutureUseCase<String, String> {
  @override
  Future<String> run(input) => injector.get<UserRepository>().upImage(input);
}
