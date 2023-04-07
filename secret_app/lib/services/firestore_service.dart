import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secret_app/app/app.locator.dart';
import 'package:secret_app/app/app.logger.dart';
import 'package:secret_app/constants/app_keys.dart';
import 'package:secret_app/models/appuser.dart';
import 'package:secret_app/models/chat.dart';
import 'package:secret_app/services/user_service.dart';

class FirestoreService {
  final log = getLogger('FirestoreApi');

  String? _curentUserUid = "";
  void setUserUid(String uid) {
    _curentUserUid = uid;
  }

  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection(UsersFirestoreKey);

  Future<bool> createUser({required AppUser user, required keyword}) async {
    log.i('user:$user');
    try {
      final userDocument = _usersCollection.doc(user.id);
      await userDocument.set(user.toJson(keyword));
      log.v('UserCreated at ${userDocument.path}');
      return true;
    } catch (error) {
      log.e("Error $error");
      return false;
    }
  }

  Future<AppUser?> getUser({required String userId}) async {
    log.i('userId:$userId');

    if (userId.isNotEmpty) {
      final userDoc = await _usersCollection.doc(userId).get();
      if (!userDoc.exists) {
        log.v('We have no user with id $userId in our database');
        return null;
      }

      final userData = userDoc.data();
      log.v('User found. Data: $userData');

      return AppUser.fromMap(userData! as Map<String, dynamic>);
    } else {
      log.e("Error no user");
      return null;
    }
  }

  Future<List<AppUser>> searchUsers(String keyword) async {
    log.i("searching for $keyword");
    final query = _usersCollection
        .where('keyword', arrayContains: keyword.toLowerCase())
        .limit(5);

    final snapshot = await query.get();

    return snapshot.docs
        .map((doc) => AppUser.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  ///Chat =======================================================================
  final CollectionReference _chatsCollectionReference =
      FirebaseFirestore.instance.collection('chats');

  Future<Chat> createChat(Chat chat) async {
    try {
      final chatRef = _chatsCollectionReference.doc();
      final chatUpdated = Chat(
        id: chatRef.id,
        name: chat.name,
        members: chat.members,
        createdAt: chat.createdAt,
      );
      // final DocumentReference documentReference =
      await chatRef.set(chatUpdated.toJson());
      return chatUpdated;
    } catch (e) {
      log.e('createChat Error: ${e.toString()}');
      rethrow;
    }
  }

  Future<void> updateChat(Chat chat) async {
    try {
      await _chatsCollectionReference.doc(chat.id).update(chat.toJson());
    } catch (e) {
      log.e('updateChat Error: ${e.toString()}');
      rethrow;
    }
  }

  Future<void> deleteChat(Chat chat) async {
    try {
      await _chatsCollectionReference.doc(chat.id).delete();
    } catch (e) {
      log.e('deleteChat Error: ${e.toString()}');
      rethrow;
    }
  }

  Stream<List<Chat>> getChats() {
    try {
      return _chatsCollectionReference
          .where('userIds', arrayContains: _curentUserUid!)
          .snapshots()
          .map((QuerySnapshot querySnapshot) => querySnapshot.docs
              .map((DocumentSnapshot documentSnapshot) => Chat.fromJson(
                  documentSnapshot.data() as Map<String, dynamic>))
              .toList());
    } catch (e) {
      log.e('getChats Error: ${e.toString()}');
      rethrow;
    }
  }
}
