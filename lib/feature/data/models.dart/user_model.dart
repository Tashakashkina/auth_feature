import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  bool? isVerified;
  final String? phone;

  UserModel({this.uid, this.phone, bool? isVerified});

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
    };
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : uid = doc.id,
        phone = doc.data()!["phone"];

  UserModel copyWith({
    bool? isVerified,
    String? uid,
    String? phone,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      isVerified: isVerified ?? this.isVerified,
      phone: phone ?? this.phone,
    );
  }
}
