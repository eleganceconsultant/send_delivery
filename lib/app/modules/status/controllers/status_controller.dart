import 'package:get/get.dart';

StatusController statusCtr = Get.put(StatusController());
class StatusController extends GetxController {
  //TODO: Implement StatusController

  final count = 0.obs;

  final status = "".obs;
  @override
  void onInit() {
    super.onInit();
  }
  set(){
    status.value = "sendBack";
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
