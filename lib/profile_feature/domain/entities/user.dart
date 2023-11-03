import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? uid;
  final String? email;
  final DateTime? time;

  const User({
    required this.uid,
    required this.email,
    required this.time,
  });

  @override
  List<Object?> get props => [uid, email, time];
}
