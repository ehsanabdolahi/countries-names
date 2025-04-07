import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/login_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;

  AuthBloc({required this.loginUser}) : super(AuthInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<LogoutButtonPressed>(_onLogoutButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
      LoginButtonPressed event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());

    final result = await loginUser.execute(event.email, event.password);

    emit(result.fold(
          (failure) => AuthError(message: failure.message),
          (user) => AuthAuthenticated(user: user),
    ));
  }

  Future<void> _onLogoutButtonPressed(
      LogoutButtonPressed event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());
    // Here we would typically call a logout use case
    // For now, we'll just emit the unauthenticated state
    emit(AuthUnauthenticated());
  }
}