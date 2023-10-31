import 'package:auth_feature/profile_feature/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String uid,
    required String email,
    required int time,
  }) : super(uid: uid, email: email, time: time);

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'time': time,
    };
  }
}
