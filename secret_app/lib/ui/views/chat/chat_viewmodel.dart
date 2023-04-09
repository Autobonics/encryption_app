import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:secret_app/app/app.locator.dart';
import 'package:secret_app/app/app.logger.dart';
import 'package:secret_app/models/appuser.dart';
import 'package:secret_app/models/chat.dart';
import 'package:secret_app/models/chat_message.dart';
import 'package:secret_app/services/encrypt_service.dart';
import 'package:secret_app/services/firestore_service.dart';
import 'package:secret_app/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatViewModel extends StreamViewModel<List<ChatMessage>>
    with FormStateHelper {
  final log = getLogger('ChatViewModel');

  // final _navigationService = locator<NavigationService>();
  // final _dialogService = locator<DialogService>();
  // final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();
  final FirestoreService _firestoreService = FirestoreService();
  final _encryptService = locator<EncryptService>();

  AppUser? get user => _userService.user;
  AppUser? _receiver;
  AppUser? get receiver => _receiver;

  List<int> securityLevels = <int>[0, 1, 2];
  int _securityLevel = 0;
  int get securityLevel => _securityLevel;
  void setSecurityLevel(int? level) {
    _securityLevel = level ?? 0;
    notifyListeners();
  }

  final TextEditingController messageController = TextEditingController();

  final Chat chat;
  ChatViewModel({
    required this.chat,
  });

  void onModelReady() async {
    setBusy(true);
    final String rUid =
        chat.members.where((element) => element != user!.id).toList().first;
    _receiver = await _firestoreService.getUser(userId: rUid);
    if (_receiver != null) {
      log.i("Receiver: ${receiver!.fullName}");
    }
    setBusy(false);
  }

  AppUser getUser(String id) {
    if (id == user!.id) {
      return user!;
    } else {
      return _receiver!;
    }
  }

  List<String> _fileLinks = <String>[];
  List<String> get fileLinks => _fileLinks;

  Future<void> sendMessage() async {
    log.i("message");
    // if()
    final newMessage = ChatMessage(
      message: _encryptService.encryptText(
          messageController.text, chat.encryptionKey),
      senderId: user!.id,
      timestamp: DateTime.now(),
      fileLinks: fileLinks,
      id: '',
      securityLevel: _securityLevel,
    );
    messageController.clear();
    await _firestoreService.addChatMessage(chat, newMessage);
  }

  File? _fileSelected;
  File? get fileSelected => _fileSelected;
  Future filePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      _fileSelected = File(result.files.single.path!);
    } else {
      log.i("File picker error");
    }
  }

  Future<void> deleteMessage(ChatMessage message) async {
    await _firestoreService.deleteChatMessage(chat.id, message.id);
  }

  @override
  Stream<List<ChatMessage>> get stream =>
      _firestoreService.getChatMessagesStream(chat.id);
}
