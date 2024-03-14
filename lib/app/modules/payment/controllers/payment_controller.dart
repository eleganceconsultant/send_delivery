import 'package:get/get.dart';
import 'package:send_delivery/app/modules/payment/views/payment2_view.dart';

PaymentController paymentCtr = Get.put(PaymentController());

class PaymentController extends GetxController {
  //TODO: Implement PaymentController

  final count = 0.obs;

  RxString payType = "".obs;


  paymentType(type){
     Get.to(() => Payment2View());
    return payType.value = type;
  }
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
