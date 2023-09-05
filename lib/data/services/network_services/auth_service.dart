import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../models/user/login/login_request_model.dart';
import '../../models/user/register/register_request_model.dart';
import '../../models/user/user_model.dart';
import '../../models/user/user_response_model.dart';

class AuthService {
  final ref = FirebaseDatabase.instance.ref();
  final auth = FirebaseAuth.instance;

  Future<UserResponseModel?> login(
    LoginRequestModel _loginRequestModel,
  ) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: _loginRequestModel.email,
        password: _loginRequestModel.password,
      );
      final userId = auth.currentUser?.uid;
      final idToken = await auth.currentUser?.getIdTokenResult();
      final snapShot = await ref
          .child(
            'account/$userId',
          )
          .get();
      final map = snapShot.value as Map<dynamic, dynamic>;
      final user = UserModel.fromJson(
        Map<String, dynamic>.from(map),
      );
      final userResponse = UserResponseModel(
        user: user,
        token: idToken?.token ?? '',
      );
      return userResponse;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return null;
      }
    }
  }

  Future<UserResponseModel?> register(
      RegisterRequestModel registerRequestModel) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
        email: registerRequestModel.email,
        password: registerRequestModel.password,
      );
      if (result.user == null) {
        return null;
      } else {
        final user = UserModel(
          id: result.user!.uid,
          email: registerRequestModel.email,
          password: registerRequestModel.password,
          phone: registerRequestModel.phone,
          gender: registerRequestModel.gender,
          name: registerRequestModel.name,
        );
        final idTokenResult = await result.user?.getIdTokenResult();
        final userResponseModel = UserResponseModel(
          user: user,
          token: idTokenResult?.token ?? '',
        );
        return userResponseModel;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return null;
      }
    }
    return null;
  }
}
