import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:secret_app/app/app.locator.dart';
import 'package:secret_app/app/app.logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StorageService with ListenableServiceMixin {
  final log = getLogger('StorageService');
  // StorageService() {
  //   _uploadTaskController.addListener(() {
  //     notifyListeners();
  //   });
  // }

  final _storage = FirebaseStorage.instance;
  // final _uploadTaskController = StreamController<TaskSnapshot>();

  // Stream<TaskSnapshot> get uploadTaskStream => _uploadTaskController.stream;
  double _progress = 0;
  double get progress => _progress;

  Future<String> uploadFile(File file, String path) async {
    // final filePath = 'chats/${DateTime.now().millisecondsSinceEpoch}';
    final filePath = path;
    final reference = _storage.ref().child(filePath);
    final uploadTask = reference.putFile(file);

    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      // snapshot
      _progress = snapshot.bytesTransferred / snapshot.totalBytes * 100;
      notifyListeners();
      // return Text('${progress.toStringAsFixed(2)}%');
    });

    final snapshot = await uploadTask.whenComplete(() {});
    final url = await snapshot.ref.getDownloadURL();

    return url;
  }

  Future deleteFile() async {
    final Reference storageRef = _storage.ref().child('path/to/file');
    try {
      await storageRef.delete();
      log.i('File deleted successfully.');
    } catch (e) {
      log.i('Error deleting file: $e');
    }
  }

  // @override
  // void dispose() {
  //   _uploadTaskController.close();
  //   super.dispose();
  // }
}
