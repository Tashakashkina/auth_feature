import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmailPasswordParams extends Equatable {
  final String email;
  final String password;

  const EmailPasswordParams({required this.email, required this.password});

  @override
  List<Object?> get props => [];
}

class UserDataParams extends Equatable {
  final String uid;
  final String email;
  final int time;

  const UserDataParams(
      {required this.uid, required this.email, required this.time});

  @override
  List<Object?> get props => [uid, email, time];
}
