part of 'auth_cubit.dart';

enum AuthStatus { initial, loading, success, error }

final class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.initial,
  });

  final AuthStatus status;

  AuthState copyWith({
    AuthStatus? status,
  }) {
    return AuthState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
