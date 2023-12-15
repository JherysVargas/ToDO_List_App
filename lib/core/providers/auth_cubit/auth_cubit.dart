import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/use_cases/auth/auth_use_cases.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase authUseCase;

  AuthCubit({required this.authUseCase}) : super(const AuthState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final bool result = await authUseCase.login(email, password);

    if (result) {
      emit(state.copyWith(status: AuthStatus.success));
    } else {
      emit(state.copyWith(status: AuthStatus.error));
    }
  }

  Future<void> signOut() async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      await authUseCase.signOut();
      emit(state.copyWith(status: AuthStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error));
    }
  }
}
