import 'package:flutter/material.dart';
import 'package:secret_app/app/app.locator.dart';
import 'package:secret_app/app/app.logger.dart';
import 'package:secret_app/models/appuser.dart';
import 'package:secret_app/models/chat.dart';
import 'package:secret_app/services/encrypt_service.dart';
import 'package:secret_app/services/firestore_service.dart';
import 'package:secret_app/services/user_service.dart';
import 'package:stacked/stacked.dart';

class NoticeSheetModel extends BaseViewModel {
  final log = getLogger('NoticeSheetModel');

  final FirestoreService _firestoreService = locator<FirestoreService>();
  final _userService = locator<UserService>();
  final _encryptService = locator<EncryptService>();

  List<AppUser> _users = [];
  List<AppUser> get users => _users;

  final TextEditingController messageController = TextEditingController();

  Future<void> searchUsers(String keyword) async {
    if (keyword.isNotEmpty) {
      setBusy(true);
      log.i("getting users");
      try {
        _users = await _firestoreService.searchUsers(keyword);
        log.i(_users.length);
        _users = _users
            .where((element) => element.id != _userService.user!.id)
            .toList();
        setError(null);
      } catch (e) {
        setError(e.toString());
      }

      setBusy(false);
    }
  }

  AppUser? _user;
  AppUser? get user => _user;

  void setUser(AppUser user) {
    _user = user;
    messageController.clear();
    notifyListeners();
  }

  String _chatName = '';
  String get chatName => _chatName;

  void setChatName(String value) {
    _chatName = value;
    notifyListeners();
  }

  Future<Chat> createChat() async {
    final chatName = _chatName.isNotEmpty ? _chatName : user!.fullName;
    String encryptionKey = _encryptService.generateKey();
    final chat =
        Chat.create(chatName, [_userService.user!.id, user!.id], encryptionKey);
    final chatCreated = await _firestoreService.createChat(chat);
    // await _navigationService.back();
    return chatCreated;
  }
}
