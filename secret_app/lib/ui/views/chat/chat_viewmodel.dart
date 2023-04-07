import 'dart:async';

import 'package:flutter/material.dart';
import 'package:secret_app/app/app.locator.dart';
import 'package:secret_app/app/app.logger.dart';
import 'package:secret_app/models/appuser.dart';
import 'package:secret_app/models/chat.dart';
import 'package:secret_app/models/chat_message.dart';
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

  AppUser? get user => _userService.user;

  final TextEditingController messageController = TextEditingController();

  final Chat chat;
  ChatViewModel({
    required this.chat,
  });

  // Future<void> init(Chat chat) async {
  //   this.chat = chat;
  // }
  List<String> _fileLinks = <String>[];
  List<String> get fileLinks => _fileLinks;
  Future<void> sendMessage() async {
    log.i("message");
    final newMessage = ChatMessage(
      message: messageController.text,
      senderId: user!.id,
      timestamp: DateTime.now(),
      fileLinks: fileLinks,
      id: '',
    );
    messageController.clear();
    await _firestoreService.addChatMessage(chat, newMessage);
  }

  Future<void> deleteMessage(ChatMessage message) async {
    await _firestoreService.deleteChatMessage(chat.id, message.id);
  }

  @override
  Stream<List<ChatMessage>> get stream =>
      _firestoreService.getChatMessagesStream(chat.id);
}
