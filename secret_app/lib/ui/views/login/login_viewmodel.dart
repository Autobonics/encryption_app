import 'package:secret_app/app/app.locator.dart';
import 'package:secret_app/app/app.logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class LoginViewModel extends BaseViewModel {
  final logger = getLogger('LoginViewModel');
  final _authenticationService = locator<FirebaseAuthenticationService>();

  void login() async {
    final auth = await _authenticationService.signInWithGoogle();
    if (auth.user != null) {}
  }
}
