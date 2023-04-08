import 'dart:convert';
import 'dart:io' as io;
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_face_api/face_api.dart' as Regula;
import 'package:image_picker/image_picker.dart';
import 'package:secret_app/app/app.logger.dart';

class RegulaService {
  final log = getLogger('EncryptService');

  // late Regula.FaceSDK _faceSDK;

  Future<void> initPlatformState() async {
    Regula.FaceSDK.init().then((json) {
      var response = jsonDecode(json);
      if (!response["success"]) {
        log.i("Init failed: ");
        log.i(json);
      }
    });

    // const EventChannel('flutter_face_api/event/video_encoder_completion')
    //     .receiveBroadcastStream()
    //     .listen((event) {
    //   var response = jsonDecode(event);
    //   String transactionId = response["transactionId"];
    //   bool success = response["success"];
    //   log.i("video_encoder_completion:");
    //   log.i("    success: $success");
    //   log.i("    transactionId: $transactionId");
    // });
  }

  Future<String?> imageBitmap() async {
    final result = await Regula.FaceSDK.presentFaceCaptureActivity();
    if (result != null) {
      log.i("result");
      Regula.FaceCaptureResponse? response =
          Regula.FaceCaptureResponse.fromJson(json.decode(result));
      if (response != null && response.image != null) {
        log.i("image");
        Uint8List imageFile =
            base64Decode(response.image!.bitmap!.replaceAll("\n", ""));

        return base64Encode(imageFile);
      }
    }
    return null;
  }
}
