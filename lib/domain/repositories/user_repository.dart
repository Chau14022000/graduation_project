import '../entities/user/login/login_request_entities.dart';
import '../entities/user/register/register_request_entities.dart';
import '../entities/user/user_entities.dart';
import '../entities/user/user_response_entities.dart';

abstract class UserRepository {
  Future<UserResponseEntities?> login(
    LoginRequestEntities loginRequest,
  );

  Future<UserResponseEntities?> register(
    RegisterRequestEntities registerRequest,
  );

  Future<UserEntities> getAccount();

  Future<void> updateAccount(
    UserEntities userEntities,
  );

  Future<String> upImage(
    String string,
  );
}
