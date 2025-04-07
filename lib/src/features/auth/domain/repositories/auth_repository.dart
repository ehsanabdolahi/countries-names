import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, List<UserEntity>>> getUsers();

  Future<Either<Failure, UserEntity>> loginUser(String email, String password);
}
