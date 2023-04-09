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
import 'package:secret_app/services/storage_service.dart';
import 'package:secret_app/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MessageSenderModel extends ReactiveViewModel {
  final log = getLogger('ChatViewModel');

  // final _navigationService = locator<NavigationService>();
  // final _dialogService = locator<DialogService>();
  // final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();
  final FirestoreService _firestoreService = FirestoreService();
  final StorageService _storageService = StorageService();
  final _encryptService = locator<EncryptService>();

  AppUser? get user => _userService.user;

  List<int> securityLevels = <int>[0, 1, 2];
  int _securityLevel = 0;
  int get securityLevel => _securityLevel;
  void setSecurityLevel(int? level) {
    _securityLevel = level ?? 0;
    notifyListeners();
  }

  final TextEditingController messageController = TextEditingController();

  final Chat chat;
  MessageSenderModel({
    required this.chat,
  });

  void onModelReady() async {
    setBusy(true);
    _securityLevel = securityLevel;
    log.i("Message seder ready security level: $_securityLevel");
    setBusy(false);
    addListenerController();
  }

  void addListenerController() {
    messageController.addListener(() {
      if (messageController.text.isNotEmpty || messageController.text.isEmpty) {
        notifyListeners();
      }
    });
  }

  double get progress => _storageService.progress;

  Future<void> sendMessage() async {
    log.i("message");
    String messageId = await _firestoreService.getChatMessageId(chat);
    String? fileUrl;
    if (_fileSelected != null) {
      final encryptedFile =
          await _encryptService.encryptFile(_fileSelected!, chat.encryptionKey);
      fileUrl = await _storageService.uploadFile(
          encryptedFile, "chats/${chat.id}/$messageId");
      notifyListeners();
    }
    final newMessage = ChatMessage(
      message: messageController.text.isNotEmpty
          ? _encryptService.encryptText(
              messageController.text, chat.encryptionKey)
          : _encryptService.encryptText(
              'File: ${_fileSelected!.path.split(".").last}',
              chat.encryptionKey),
      senderId: user!.id,
      timestamp: DateTime.now(),
      fileLink: fileUrl ?? '',
      fileFormat: fileUrl != null ? _fileSelected!.path.split(".").last : '',
      id: messageId,
      securityLevel: _securityLevel,
    );
    messageController.clear();
    if (_fileSelected != null) _fileSelected = null;
    await _firestoreService.addChatMessage(chat, newMessage, id: newMessage.id);
  }

  File? _fileSelected;
  File? get fileSelected => _fileSelected;
  Future filePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'pdf', 'doc'],
    );

    if (result != null) {
      _fileSelected = File(result.files.single.path!);
      log.i(result.files.single.path);
      notifyListeners();
    } else {
      log.i("File picker error");
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_storageService];

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
