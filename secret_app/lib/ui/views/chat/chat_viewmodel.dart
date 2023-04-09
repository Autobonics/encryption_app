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

class ChatViewModel extends StreamViewModel<List<ChatMessage>>
    with FormStateHelper {
  final log = getLogger('ChatViewModel');

  // final _navigationService = locator<NavigationService>();
  // final _dialogService = locator<DialogService>();
  // final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();
  final FirestoreService _firestoreService = FirestoreService();

  AppUser? get user => _userService.user;
  AppUser? _receiver;
  AppUser? get receiver => _receiver;

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

  @override
  Stream<List<ChatMessage>> get stream =>
      _firestoreService.getChatMessagesStream(chat.id);
}
