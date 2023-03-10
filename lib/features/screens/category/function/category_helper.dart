import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';

class CategoryHelper {
  static Future<bool> checkFileType(dynamic file) async {
    if (file is String) {
      // If the input is a string, assume it's a URL
      // and try to download the image
      final response = await http.get(Uri.parse(file));
      file = response.bodyBytes;
    }

    // Compress the image and get its MIME type
    final compressedImage = await FlutterImageCompress.compressWithList(file);
    final mimeType = lookupMimeType('image.jpg', headerBytes: compressedImage);

    if (mimeType!.startsWith('image/')) {
      return true;
    } else {
      return true;
    }
  }

  static bool isNetworkImage(dynamic image) {
    if (image is ImageProvider) {
      return image is NetworkImage;
    } else if (image is String) {
      return image.startsWith('http') || image.startsWith('https');
    }
    return false;
  }
}
