import '../../../../data/models/user/login/login_request_model.dart';

class LoginRequestEntities {
  const LoginRequestEntities({
    required this.email,
    required this.password,
  });

  final String email;

  final String password;

  LoginRequestModel toLoginRequestModel() => LoginRequestModel(
        email: email,
        password: password,
      );
}
