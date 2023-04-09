import 'package:secret_app/app/app.bottomsheets.dart';
import 'package:secret_app/app/app.locator.dart';
import 'package:secret_app/app/app.logger.dart';
import 'package:secret_app/models/appuser.dart';
import 'package:secret_app/models/chat.dart';
import 'package:secret_app/models/chat_message.dart';
import 'package:secret_app/services/encrypt_service.dart';
import 'package:secret_app/services/firestore_service.dart';
import 'package:secret_app/services/regula_service.dart';
import 'package:secret_app/services/storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MessageTileModel extends BaseViewModel {
  final log = getLogger('MessageTileModel');

  final _bottomSheetService = locator<BottomSheetService>();
  final RegulaService _regulaService = RegulaService();
  final _encryptService = locator<EncryptService>();
  final FirestoreService _firestoreService = FirestoreService();
  final StorageService _storageService = StorageService();
  late Chat _chat;
  late AppUser _user;
  late ChatMessage _chatMessage;
  void onModelReady(Chat chat, ChatMessage chatMessage, AppUser user) async {
    _chat = chat;
    _user = user;
    _chatMessage = chatMessage;
    if (_chatMessage.securityLevel == 0) _isUnlocked = true;
    notifyListeners();
  }

  bool _isUnlocked = false;
  bool get isUnlocked => _isUnlocked;
  void unLock() async {
    setBusy(true);
    double? matchedFace = await _regulaService.checkMatch(_user.imgString!,
        isLiveness: _chatMessage.securityLevel == 2);
    if (matchedFace == null) {
      _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.alert,
        title: "Canceled",
        description: "",
      );
    } else if (matchedFace > 90) {
      log.i("Unlocked: $matchedFace%");
      _isUnlocked = true;
      setBusy(false);
      _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.success,
        title: "Face unlocked",
        description: "You can now view the file.",
      );
    } else {
      _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.alert,
        title: "No verified",
        description: "User not verified or try again.",
      );
    }
    setBusy(false);
  }

  Future<void> deleteMessage() async {
    log.i("Delete message");
    setBusy(true);
    if (_chatMessage.fileLink != '') {
      await _storageService.deleteFile("chats/${_chat.id}/${_chatMessage.id}");
    }
    await _firestoreService.deleteChatMessage(_chat.id, _chatMessage.id);
    setBusy(false);
  }

  String textDecrypt(String text) {
    return _encryptService.decryptText(text, _chat.encryptionKey);
  }
}
