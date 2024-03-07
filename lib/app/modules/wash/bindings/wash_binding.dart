import 'package:get/get.dart';

import '../controllers/wash_controller.dart';

class WashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WashController>(
      () => WashController(),
    );
  }
}
