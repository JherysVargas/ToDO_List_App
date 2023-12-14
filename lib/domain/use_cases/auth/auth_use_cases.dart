import 'package:injectable/injectable.dart';
import 'package:todo/domain/models/auth/gateway/auth.dart';

@injectable
class AuthUseCase {
  final AuthGateway _taskGateway;
  AuthUseCase(this._taskGateway);

  Future<bool> login(String email, String password) =>
      _taskGateway.login(email, password);

  Future<void> signOut() => _taskGateway.signOut();
}
