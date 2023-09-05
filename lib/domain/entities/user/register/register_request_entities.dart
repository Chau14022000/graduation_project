import '../../../../data/models/user/register/register_request_model.dart';

class RegisterRequestEntities {
  const RegisterRequestEntities({
    required this.email,
    required this.password,
    required this.phone,
    required this.gender,
    required this.name,
    this.avatar,
  });

  final String email;

  final String phone;

  final String gender;

  final String password;

  final String name;

  final String? avatar;

  RegisterRequestModel toRegisterRequestModel() => RegisterRequestModel(
        email: email,
        password: password,
        phone: phone,
        gender: gender,
        name: name,
      );
}
