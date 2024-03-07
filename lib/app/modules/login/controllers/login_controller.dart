import 'package:get/get.dart';
import 'package:send_delivery/app/modules/home/views/home_page_view.dart';
import 'package:send_delivery/app/modules/login/views/otp_view.dart';
import 'package:send_delivery/app/services/otp_api.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
  final isLogin = false.obs;
  final phone = "".obs;

  @override
  void onInit() {
    phone.value = "";
    if (isLogin.value == true) {
      Get.to(HomePageView());
    }
    super.onInit();
  }

  @override
  void onReady() {
    phone.value = "";
    if (isLogin.value == true) {
      Get.to(HomePageView());
    }
    super.onReady();
  }

  @override
  void onClose() {
    phone.value = "";
    super.onClose();
  }

  sendOtp(phone) {
    print("PH-F: ${phone}");
    OtpApi().sendOTP(phone).then((value) {
      Get.to(OtpView(), arguments: 
        [phone.toString(),  value.token]
      );
      print(value.token);
    });
  }
}
