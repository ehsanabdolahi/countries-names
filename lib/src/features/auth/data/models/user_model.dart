// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    // ignore: invalid_annotation_target
    @JsonKey(name: "users")
    required List<User> users,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    // ignore: invalid_annotation_target
    @JsonKey(name: "email")
    required String email,
    // ignore: invalid_annotation_target
    @JsonKey(name: "password")
    required String password,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
