import 'package:secret_app/app/app.locator.dart';
import 'package:secret_app/app/app.logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class LoginViewModel extends FormViewModel {
  final log = getLogger('LoginViewModel');
  final _authenticationService = locator<FirebaseAuthenticationService>();

  void login() async {
    final auth = await _authenticationService.signInWithGoogle();
    log.i(auth.errorMessage);
    if (auth.user != null) {
      log.i("User got:");
      log.i(auth.user!.displayName);
    }
  }
}
