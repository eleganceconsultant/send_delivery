import 'package:get/get.dart';

PaymentController paymentCtr = Get.put(PaymentController());

class PaymentController extends GetxController {
  //TODO: Implement PaymentController

  final count = 0.obs;

  RxBool status = true.obs;
  RxString payType = "AAA".obs;
  @override
  void onInit() {
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

  void increment() => count.value++;
}
