import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/user/user_response_entities.dart';
import 'user_model.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  const UserResponseModel({
    required this.user,
    required this.token,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  @JsonKey(name: 'account')
  final UserModel user;

  @JsonKey(name: 'token')
  final String token;

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);

  UserResponseEntities toUserResponseEntities() => UserResponseEntities(
        user: user.toUserEntities(),
        token: token,
      );
}
