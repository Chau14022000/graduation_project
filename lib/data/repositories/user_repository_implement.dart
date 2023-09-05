import '../../domain/entities/user/login/login_request_entities.dart';
import '../../domain/entities/user/register/register_request_entities.dart';
import '../../domain/entities/user/user_entities.dart';
import '../../domain/entities/user/user_response_entities.dart';
import '../../domain/repositories/user_repository.dart';
import '../services/network_services/auth_service.dart';
import '../services/network_services/realtime_service.dart';
import '../services/network_services/storage_service.dart';

class UserRepositoryImplement implements UserRepository {
  UserRepositoryImplement(
    this._authService,
    this._realtimeService,
    this._storageService,
  );

  final AuthService _authService;
  final RealtimeService _realtimeService;
  final StorageService _storageService;

  @override
  Future<UserResponseEntities?> login(
    LoginRequestEntities loginRequest,
  ) async {
    final userResponseModel = await _authService.login(
      loginRequest.toLoginRequestModel(),
    );
    if (userResponseModel == null) {
      return null;
    }
    return userResponseModel.toUserResponseEntities();
  }

  @override
  Future<UserResponseEntities?> register(
    RegisterRequestEntities registerRequest,
  ) async {
    final userResponseModel = await _authService.register(
      registerRequest.toRegisterRequestModel(),
    );
    if (userResponseModel == null) {
      return null;
    } else {
      await _realtimeService.saveAccount(
        userResponseModel.user,
      );
    }

    return userResponseModel.toUserResponseEntities();
  }

  @override
  Future<UserEntities> getAccount() async {
    final account = await _realtimeService.getAccount();
    return account.toUserEntities();
  }

  @override
  Future<void> updateAccount(UserEntities userEntities) async {
    await _realtimeService.updateAccount(
      userEntities.toUserMode(),
    );
  }

  @override
  Future<String> upImage(String string) async {
    final image = await _storageService.upImage(string);
    return image;
  }
}
