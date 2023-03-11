import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';

class CustomFileType {
  static String getType(path) {
    return lookupMimeType(path.toString()).toString();
  }

  static Future<String> base64Data(path) async {
    Uint8List imageBytes = await File(path).readAsBytes(); //convert to bytes
    String base64string =
        base64.encode(imageBytes); //convert bytes to base64 string
    log(base64string);

    return base64string;
  }

  static final _httpClient = HttpClient();

  static Future<File> downloadFile({String? url, String? filename}) async {
    var request = await _httpClient.getUrl(Uri.parse(url!));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }
}
