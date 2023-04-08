import 'package:secret_app/services/firestore_service.dart';
import 'package:secret_app/services/regula_service.dart';
import 'package:secret_app/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:secret_app/app/app.locator.dart';
import 'package:secret_app/app/app.router.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final RegulaService _regulaService = RegulaService();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    if (_userService.hasLoggedInUser) {
      await _userService.fetchUser();
      _regulaService.initPlatformState();
      _navigationService.replaceWithHomeView();
    } else {
      await Future.delayed(const Duration(seconds: 1));
      _navigationService.replaceWithLoginView();
    }
  }
}
