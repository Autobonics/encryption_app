import 'package:secret_app/app/app.bottomsheets.dart';
import 'package:secret_app/app/app.locator.dart';
import 'package:secret_app/app/app.logger.dart';
import 'package:secret_app/app/app.router.dart';
import 'package:secret_app/models/appuser.dart';
import 'package:secret_app/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final log = getLogger('LoginViewModel');
  final _authenticationService = locator<FirebaseAuthenticationService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();

  void login() async {
    setBusy(true);
    final result = await _authenticationService.signInWithGoogle();
    log.i(result.errorMessage);
    if (result.user != null) {
      AppUser? _user = await _userService.fetchUser();
      if (_user == null) {
        String? error = await _userService.createUpdateUser(
          AppUser(
            id: result.user!.uid,
            fullName: result.user!.displayName ?? "Name",
            photoUrl: result.user!.photoURL ?? "nil",
            regTime: DateTime.now(),
            email: result.user!.email!,
            userRole: "user",
          ),
        );
        if (error == null) {
          setBusy(false);
          _navigationService.replaceWithHomeView();
        } else {
          log.i("Firebase error");
          _bottomSheetService.showCustomSheet(
            variant: BottomSheetType.alert,
            title: "Upload Error",
            description: error,
          );
        }
      } else {
        setBusy(false);
        _navigationService.replaceWithHomeView();
      }
    } else {
      log.i("Error: ${result.errorMessage}");
      _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.alert,
        title: "Error",
        description: result.errorMessage ?? "Enter valid credentials",
      );
    }
  }
}
