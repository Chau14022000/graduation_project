import 'package:json_annotation/json_annotation.dart';

import 'user_entities.dart';


@JsonSerializable(
  createToJson: false,
  createFactory: false,
)
class UserResponseEntities {
  const UserResponseEntities({
    required this.user,
    required this.token,
  });

  @JsonKey(name: 'account')
  final UserEntities user;

  @JsonKey(name: 'token')
  final String token;
}
