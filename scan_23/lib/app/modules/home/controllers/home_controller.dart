import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '/app/core/base/base_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class HomeController extends BaseController {
  final ImagePicker _picker = ImagePicker();
  final pdf = pw.Document();

  Future<void> scanDocument() async {
    try {
      // Step 1: Capture Image
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null) return;

      // Step 2: Add Image to PDF
      final imageFile = File(image.path);
      final imageBytes = imageFile.readAsBytesSync();
      final pdfImage = pw.MemoryImage(imageBytes);

      pdf.addPage(pw.Page(build: (pw.Context context) {
        return pw.Center(child: pw.Image(pdfImage));
      }));

      // Step 3: Save PDF to Temporary Directory
      final outputDir = await getApplicationDocumentsDirectory();
      final pdfFile = File('${outputDir.path}/scanned_document.pdf');
      await pdfFile.writeAsBytes(await pdf.save());

    //   // Step 4: Save PDF to Gallery
    //   await GallerySaver.saveFile(pdfFile.path);
    //   Get.snackbar('Success', 'PDF saved to gallery!');
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

}
