import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_doc_scanner/flutter_doc_scanner.dart';
import 'package:get/get.dart';
import 'package:saver_gallery/saver_gallery.dart';

import '/app/core/base/base_controller.dart';

class HomeController extends BaseController {
  var scannedDocuments = Rx<dynamic>(null);

  Future<void> scanDocument() async {
    try {
      final result = await FlutterDocScanner().getScanDocuments() ??
          'Unknown platform documents';
      scannedDocuments.value = result;

    } on PlatformException {
      scannedDocuments.value = 'Failed to get scanned documents.';
    }
  }

  

}