import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String password;
  final String? name;

  const User({
    required this.email,
    required this.password,
    this.name,
  });

  @override
  List<Object?> get props => [email, password, name];
}
