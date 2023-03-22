import 'package:secret_app/app/app.locator.dart';
import 'package:secret_app/app/app.logger.dart';
import 'package:secret_app/models/appuser.dart';
import 'package:secret_app/services/firestore_service.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class UserService {
  final log = getLogger('UserService');
  final _authenticationService = locator<FirebaseAuthenticationService>();
  final _firestoreService = locator<FirestoreService>();

  AppUser? _user;
  AppUser? get user => _user;

  void setUser(AppUser user) {
    _firestoreService.createUser(
      user: user,
      keyword: _createKeyWords(user.fullName),
    );
  }

  Future<bool> fetchUser() async {
    final uid = _authenticationService.currentUser?.uid;
    if (uid != null) {
      final user = await _firestoreService.getUser(userId: uid);
      if (user != null) {
        _user = user;
      }
    }
    return false;
  }

  ///keywords list creating function
  List<String> _createKeyWords(String text) {
    text = text.toLowerCase();
    List<String> keywords = [];
    for (int i = 0; i <= text.length; i++) {
      if (i > 0) keywords.add(text.substring(0, i));
    }

    //taking second onward words
    final List<String> split = text.split(' ');
    if (split.length > 1) {
      split.removeAt(0);
      keywords.addAll(split);
    }
    log.i(keywords);
    return keywords;
  }
}
