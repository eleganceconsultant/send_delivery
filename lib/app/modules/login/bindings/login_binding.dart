import 'package:get/get.dart';

import 'package:send_delivery/app/modules/login/controllers/otp_controller.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(
      () => OtpController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
