import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/use_cases/auth/auth_use_cases.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase authUseCase;

  AuthCubit({required this.authUseCase}) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final bool result = await authUseCase.login(email, password);

      if (result) {
        emit(AuthSuccess());
      } else {
        emit(AuthError('Error al iniciar sesión'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    try {
      await authUseCase.signOut();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
