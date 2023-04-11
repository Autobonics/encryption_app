import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:secret_app/app/app.bottomsheets.dart';
import 'package:secret_app/app/app.locator.dart';
import 'package:secret_app/app/app.logger.dart';
import 'package:stacked_services/stacked_services.dart';

class LocalAuthService {
  final log = getLogger('LocalAuthService');
  final _bottomSheetService = locator<BottomSheetService>();

  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> isAuthReady() async {
    final bool canAuthenticateWithBiometrics = await _auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await _auth.isDeviceSupported();
    return canAuthenticate;
  }

  Future<bool> authenticate() async {
    final bool isAuth = await isAuthReady();
    if (isAuth) {
      log.i("Auth ready");
      try {
        final bool didAuthenticate = await _auth.authenticate(
          localizedReason: 'Please authenticate to change face lock data',
          // options: const AuthenticationOptions(biometricOnly: true),
        );
        return didAuthenticate;
      } on PlatformException catch (e) {
        log.i("Error: $e");
        _bottomSheetService.showCustomSheet(
          variant: BottomSheetType.alert,
          title: "Local auth error",
          description: "Phone lock is not working. So proceed.",
        );
        return true;
      }
    } else {
      log.i("Auth false");
      _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.alert,
        title: "Local auth error",
        description: "Phone lock is not supported. So proceed.",
      );
      return true;
    }
  }
}
