import 'package:auth_feature/profile_feature/domain/entities/user.dart';

// class UserModel extends User {
//   const UserModel({
//     final String? uid,
//     final String? email,
//     final DateTime? time,
//   }) : super(
//           uid: uid,
//           email: email,
//           time: time,
//         );

//   // factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
//   //   return UserModel(
//   //       uid: documentSnapshot.get('uid'),
//   //       email: documentSnapshot.get('email'),
//   //       time: documentSnapshot.get(DateTime.now()));
//   // }

//   Map<String, dynamic> toDocument() {
//     return {
//       "uid": uid,
//       "email": email,
//       'time': time,
//     };
//   }
// }

class UserModel extends User {
  const UserModel({
    required String uid,
    required String email,
    required DateTime time,
  }) : super(uid: uid, email: email, time: time);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: (json['uid']).toString(),
      email: (json['email']).toString(),
      time: (json['time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'uid': uid, 'email': email, 'time': time};
  }
}
