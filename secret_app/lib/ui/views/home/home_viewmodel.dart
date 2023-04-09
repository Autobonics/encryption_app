import 'package:secret_app/app/app.bottomsheets.dart';
// import 'package:secret_app/app/app.dialogs.dart';
import 'package:secret_app/app/app.locator.dart';
import 'package:secret_app/app/app.logger.dart';
import 'package:secret_app/app/app.router.dart';
import 'package:secret_app/models/appuser.dart';
import 'package:secret_app/models/chat.dart';
import 'package:secret_app/services/firestore_service.dart';
import 'package:secret_app/services/regula_service.dart';
import 'package:secret_app/services/storage_service.dart';
import 'package:secret_app/services/user_service.dart';
import 'package:secret_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends StreamViewModel<List<Chat>> {
  final log = getLogger('HomeViewModel');

  final _navigationService = locator<NavigationService>();
  // final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();
  final FirestoreService _firestoreService = FirestoreService();
  final RegulaService _regulaService = RegulaService();
  final StorageService _storageService = StorageService();

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
    // if (user!.imgString != null) {
    //   _regulaService.setUserImage(user!.imgString!);
    // }
    setBusy(false);
  }

  void logout() {
    _userService.logout();
    _navigationService.replaceWithLoginView();
  }

  void createUpdateFaceData() async {
    setBusy(true);
    String? img = await _regulaService.setFaceAndGetImagePath();
    if (img != null) {
      log.i(img);
      await _userService.createUpdateUser(user!.copyWith(imgString: img));
      await _userService.fetchUser();
      // _regulaService.setUserImage(img);
      log.i("Showing bottom sheet");
      _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.success,
        title: "Face data updated",
        description: img ?? "Face unlock is added for extra security.",
      );
    } else {
      _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.alert,
        title: "Canceled",
        description: "",
      );
    }
    setBusy(false);
  }

  void showBottomSheetUserSearch() async {
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
    if (result != null) {
      if (result.confirmed) log.i("Chat created: ${result.data.name}");
    }
  }

  bool _isChatDeleting = false;
  bool get isChatDeleting => _isChatDeleting;
  void deleteChat(Chat chat) async {
    _isChatDeleting = true;
    notifyListeners();
    await _storageService.deleteChatFiles(chat.id);
    await _firestoreService.deleteChat(chat);
    _isChatDeleting = false;
    notifyListeners();
  }

  ///===========================
  @override
  Stream<List<Chat>> get stream => _firestoreService.getChats();

  Future<void> navigateToChat(Chat chat) async {
    if (!_isChatDeleting) _navigationService.navigateToChatView(chat: chat);
  }
}
