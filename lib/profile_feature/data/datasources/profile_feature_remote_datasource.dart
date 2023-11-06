import 'package:auth_feature/profile_feature/data/models/profile_feature_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProfileFeatureRemoteDataSource {
  Future<UserModel?> getUserData();
}

class ProfileFeatureRemoteDataSourceImpl
    implements ProfileFeatureRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  ProfileFeatureRemoteDataSourceImpl(
      {required this.auth, required this.firestore});

  Future<String> getCurrentUId() async => auth.currentUser!.uid;

  @override
  Future<UserModel?> getUserData() async {
    try {
      final userCollectionRef = firestore.collection("users");
      final uid = await getCurrentUId();
      final user = auth.currentUser!;
      await userCollectionRef.doc(uid).get().then((value) {
        return UserModel(
                uid: uid, email: user.email!, time: user.metadata.creationTime!)
            .toDocument();
      });
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
    return null;
  }
}

// abstract class ProfileFeatureRemoteDataSource {
//   Future<UserModel?> getUserData();
// }

// class ProfileFeatureRemoteDataSourceImpl
//     implements ProfileFeatureRemoteDataSource {
//   final FirebaseAuth instance;
//   final _auth = FirebaseAuth.instance;
//   ProfileFeatureRemoteDataSourceImpl({
//     required this.instance,
//   });

//   @override
//   Future<UserModel?> getUserData() async {
//     try {
//       final user = _auth.currentUser!;
//       return UserModel(
//           uid: user.uid, email: user.email!, time: user.metadata.creationTime!);
//     } on FirebaseAuthException catch (e) {
//       throw FirebaseAuthException(code: e.code, message: e.message);
//     }
//   }
// }
