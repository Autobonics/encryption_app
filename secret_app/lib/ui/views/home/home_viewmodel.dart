import 'package:secret_app/app/app.bottomsheets.dart';
import 'package:secret_app/app/app.dialogs.dart';
import 'package:secret_app/app/app.locator.dart';
import 'package:secret_app/app/app.logger.dart';
import 'package:secret_app/app/app.router.dart';
import 'package:secret_app/models/appuser.dart';
import 'package:secret_app/services/user_service.dart';
import 'package:secret_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');

  final _navigationService = locator<NavigationService>();
  // final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();

  AppUser? get user => _userService.user;

  void onModelReady() async {
    setBusy(true);
    if (user == null) {
      AppUser? user = await _userService.fetchUser();
      if (user != null) {
        log.i(user.fullName);
      } else {
        log.i("No user document");
      }
    }
    setBusy(false);
  }

  void logout() {
    _userService.logout();
    _navigationService.replaceWithLoginView();
  }

  void showBottomSheetUserSearch() async {
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
    if (result != null) {
      if (result.confirmed) log.i(result.data.fullName);
    }
  }
}
