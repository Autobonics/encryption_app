import 'package:secret_app/app/app.logger.dart';
import 'dart:io';
import 'package:encrypt/encrypt.dart';

class EncryptService {
  final log = getLogger('EncryptService');

  String generateKey() {
    final key = Key.fromSecureRandom(32);
    final encodedKey = key.base64;
    log.i('Generated key: $encodedKey');
    return encodedKey;
  }

  String encryptText(String plainText, String keyIn) {
    final key = Key.fromBase64(keyIn);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  String decryptText(String encrypted, String keyIn) {
    final key = Key.fromBase64(keyIn);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final decrypted = encrypter.decrypt64(encrypted, iv: iv);
    return decrypted;
  }

  Future<File> encryptFile(File file, String key) async {
    final contents = await file.readAsBytes();
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(Key.fromUtf8(key)));
    final encrypted = encrypter.encryptBytes(contents, iv: iv);
    final encryptedFile = File('${file.path}.enc');
    await encryptedFile.writeAsBytes(encrypted.bytes);
    return encryptedFile;
  }

  Future<File> decryptFile(File file, String key) async {
    final contents = await file.readAsBytes();
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(Key.fromUtf8(key)));
    final decrypted = encrypter.decryptBytes(Encrypted(contents), iv: iv);
    final decryptedFile = File(file.path.substring(0, file.path.length - 4));
    await decryptedFile.writeAsBytes(decrypted);
    return decryptedFile;
  }
}
