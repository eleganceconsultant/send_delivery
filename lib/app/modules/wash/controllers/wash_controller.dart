import 'package:get/get.dart';
import 'package:send_delivery/app/data/brand_model.dart';
import 'package:send_delivery/app/services/brans_api.dart';

WashController washCtr = Get.put(WashController());

class WashController extends GetxController {
  //TODO: Implement WashController

  final count = 0.obs;
  var isLoad = true.obs;
  var brands;
  BrandsResponse? brandsResponse;
  final name = "".obs;

  @override
  void onInit() {
    print("+++++++++++++++++++ BRAND +++++++++++++++++");
    BrandsApi.getBrand().then((value) {
      print(value);
      brandsResponse = value;
      isLoad.value = false;
  print("Length: ${brandsResponse!.data.length}");
      // for (var i = 0; i < brandsResponse!.data.length; i++) {
      //   name.value = brandsResponse!.data[i].attributes.name;
      //    print("Name: " + name.value);
      // }
     
    });
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
}
