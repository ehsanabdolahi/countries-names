import 'package:dio/dio.dart';

import '../../../../constants/categories/api_category.dart';
import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<User>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<User>> getUsers() async {
    try {
      final response = await dio.get(APICategory.usersEndpoint);

      if (response.statusCode == 200) {
        final userModel = userModelFromJson(response.data);
        return userModel.users;
      } else {
        throw ServerException(message: 'Failed to fetch users data');
      }
    } catch (e) {
      throw ServerException(message: 'Failed to fetch users data: ${e.toString()}');
    }
  }
}