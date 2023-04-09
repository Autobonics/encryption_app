import 'package:secret_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:secret_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:secret_app/ui/views/home/home_view.dart';
import 'package:secret_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:secret_app/ui/views/login/login_view.dart';
import 'package:secret_app/ui/views/settings/settings_view.dart';
import 'package:secret_app/services/firestore_service.dart';
import 'package:secret_app/services/user_service.dart';
import 'package:secret_app/ui/views/profile/profile_view.dart';
import 'package:secret_app/ui/bottom_sheets/alert/alert_sheet.dart';
import 'package:secret_app/ui/views/chat/chat_view.dart';
import 'package:secret_app/services/encrypt_service.dart';
import 'package:secret_app/services/regula_service.dart';
import 'package:secret_app/ui/bottom_sheets/success/success_sheet.dart';
import 'package:secret_app/ui/bottom_sheets/success/success_sheet.dart';
import 'package:secret_app/services/storage_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: ChatView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: FirebaseAuthenticationService),
    LazySingleton(classType: FirestoreService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: EncryptService),
    LazySingleton(classType: RegulaService),
    LazySingleton(classType: StorageService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: AlertSheet),
    StackedBottomsheet(classType: SuccessSheet),
    StackedBottomsheet(classType: SuccessSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
