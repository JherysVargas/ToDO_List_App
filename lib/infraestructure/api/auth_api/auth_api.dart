import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/domain/models/auth/gateway/auth.dart';

@Injectable(as: AuthGateway)
class AuthImpl extends AuthGateway {
  final Logger _logger;
  final FirebaseAuth _firebaseAuth;

  AuthImpl(this._firebaseAuth, this._logger);

  @override
  Future<bool> login(String email, String password) async {
    try {
      final UserCredential result =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user != null) {
        return true;
      }

      return false;
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      return false;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
