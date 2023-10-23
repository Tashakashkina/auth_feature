import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class EmailPasswordParams extends Equatable {
  final String email;
  final String password;

  const EmailPasswordParams({required this.email, required this.password});

  @override
  List<Object?> get props => [];
}
