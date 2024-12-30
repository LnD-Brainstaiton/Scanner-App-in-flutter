import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '/app/core/base/base_view.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widget/paging_view.dart';
import '../controllers/home_controller.dart';
import 'package:flutter_doc_scanner/flutter_doc_scanner.dart';
import 'package:path_provider/path_provider.dart';

class HomeView extends BaseView<HomeController> {
  var scannedFilePath = ''.obs;

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }
  Future<void> scanDocument() async {
    dynamic scannedDocuments;
    try {
      scannedDocuments = await FlutterDocScanner().getScanDocuments() ??
          'Unknown platform documents';
    } on PlatformException {
      scannedDocuments = 'Failed to get scanned documents.';
    }
    if (scannedDocuments != null && scannedDocuments is String) {
      await saveDocument(scannedDocuments);
    }
  }

  Future<void> saveDocument(String scannedDocumentPath) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final savedFilePath = '${directory.path}/scanned_document.png';

      final File scannedFile = File(scannedDocumentPath);
      await scannedFile.copy(savedFilePath);

      scannedFilePath.value = savedFilePath;
      print('Document saved at: $savedFilePath');
    } catch (e) {
      print('Error saving document: $e');
    }
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            scanDocument();
            print('Button Pressed!');
          },
          child: Text('Scan'),
        ),
      ),
    );
  }
}