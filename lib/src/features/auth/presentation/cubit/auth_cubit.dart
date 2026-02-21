import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_delivery_app/src/features/auth/domain/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository _authRepository;

  AuthCubit({required IAuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial());

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.signInWithGoogle();
      if (user != null) {
        emit(AuthAuthenticated(user: user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    emit(AuthUnauthenticated());
  }

  void checkAuthStatus() {
    final user = _authRepository.currentUser;
    if (user != null) {
      emit(AuthAuthenticated(user: user));
    } else {
      emit(AuthUnauthenticated());
    }
  }
}
