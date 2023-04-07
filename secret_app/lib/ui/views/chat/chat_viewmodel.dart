import 'package:secret_app/app/app.locator.dart';
import 'package:secret_app/app/app.logger.dart';
import 'package:secret_app/models/appuser.dart';
import 'package:secret_app/models/chat.dart';
import 'package:secret_app/models/chat_message.dart';
import 'package:secret_app/services/firestore_service.dart';
import 'package:secret_app/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatViewModel extends StreamViewModel<List<ChatMessage>> {
  final log = getLogger('ChatViewModel');

  // final _navigationService = locator<NavigationService>();
  // final _dialogService = locator<DialogService>();
  // final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();
  final FirestoreService _firestoreService = FirestoreService();

  AppUser? get user => _userService.user;
  late Chat _chat;
  void onModelReady(Chat chat) async {
    _chat = chat;
  }

  ///===========================
  @override
  Stream<List<ChatMessage>> get stream =>
      _firestoreService.listenToChatMessages(_chat.id);
}
