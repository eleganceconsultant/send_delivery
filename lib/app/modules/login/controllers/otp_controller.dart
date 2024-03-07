import 'package:get/get.dart';
import 'package:send_delivery/app/services/otp_api.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController

  final args = Get.arguments;
  final phoneNumber = "".obs;
  @override
  void onInit() {
    print(args[0]);
    print(args[1]);
    phoneNumber.value = args[0];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
 verifyOTP(pin){
  OtpApi().otpVerify(args[1], pin).then((value){
    
    print(value.status);
  });
 }

}
