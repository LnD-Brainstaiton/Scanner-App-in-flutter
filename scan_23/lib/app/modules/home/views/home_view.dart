import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/base/base_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return controller.scannedDocuments.value != null
                  ? Text(controller.scannedDocuments.value.toString())
                  : const Text("No Documents Scanned");
            }),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                controller.scanDocument();
                print('Scan Button Pressed!');
              },
              child: const Text('Scan'),
            ),
          ],
        ),
      ),
    );
  }
}