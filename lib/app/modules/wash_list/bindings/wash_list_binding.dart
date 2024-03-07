import 'package:get/get.dart';

import '../controllers/wash_list_controller.dart';

class WashListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WashListController>(
      () => WashListController(),
    );
  }
}
