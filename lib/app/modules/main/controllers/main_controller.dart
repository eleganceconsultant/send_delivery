import 'package:get/get.dart';


MainController mainCtr = Get.put(MainController());
class MainController extends GetxController {
  //TODO: Implement MainController
   var currentIndex = 0.obs;
  final count = 0.obs;

  onTap(value){
    currentIndex.value = value;

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
