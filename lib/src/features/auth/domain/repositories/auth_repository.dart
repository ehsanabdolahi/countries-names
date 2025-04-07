import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, List<User>>> getUsers();

  Future<Either<Failure, User>> loginUser(String email, String password);
}
