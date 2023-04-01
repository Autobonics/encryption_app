import 'package:secret_app/app/app.bottomsheets.dart';
import 'package:secret_app/app/app.dialogs.dart';
import 'package:secret_app/app/app.locator.dart';
import 'package:secret_app/models/appuser.dart';
import 'package:secret_app/services/user_service.dart';
import 'package:secret_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();

  AppUser? get user => _userService.user;

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void onModelReady() async {
    setBusy(true);
    bool isUser = await _userService.fetchUser();
    if (!isUser) {
      // _navigationService.na
    }
    setBusy(false);
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
