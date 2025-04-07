import '../../domain/entities/user.dart';
import 'user_model.dart';

extension UserModelExtension on User {
  UserEntity toEntity() {
    return UserEntity(
      email: email,
      password: password,
    );
  }
}