import 'package:get/get.dart';
import 'package:send_delivery/app/data/brand_model.dart';
import 'package:send_delivery/app/services/brans_api.dart';


class WashController extends GetxController {
  //TODO: Implement WashController

  final count = 0.obs;
    var isLoad = true.obs;
     var brands;
   BrandsResponse? brandsResponse;

    
  @override
  void onInit() {
    print("+++++++++++++++++++ BRAND +++++++++++++++++");
    BrandsApi.getBrand().then((value) {
      print(value);
      brandsResponse = value;
      isLoad.value = false;
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
