import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:send_delivery/app/data/wash_store.dart';
import 'package:send_delivery/app/modules/home/controllers/home_controller.dart';
import 'package:send_delivery/app/services/brans_api.dart';

class WashListController extends GetxController {
  //TODO: Implement WashListController

  final km = 0.0.obs;
  HomeController homeController = Get.find();
  var brand_name = "ชื่อร้าน".obs;
  var isLoad = true.obs;
  WashStoreResponse? washStoreResponse;
  @override
  void onInit() {
    brand_name.value = Get.arguments;
    BrandsApi.getWawshStore().then((value) async{
      print(value);
      washStoreResponse = value;
      isLoad.value = false;
      km.value = await Geolocator.bearingBetween(homeController.lat.value, homeController.long.value, washStoreResponse!.data[0].attributes.lat, washStoreResponse!.data[0].attributes.long);
      //Latitude: 15.1186684, Longitude: 104.357795  "lat":15.1147298,"long":104.2816021 15.110420933124155, 104.32812214287353
      
      print(km);
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
double calculateDistance(index){
  var p = 0.017453292519943295;
  var a = 0.5 - cos((homeController.lat.value - washStoreResponse!.data[index].attributes.lat) * p)/2 + 
        cos(washStoreResponse!.data[index].attributes.lat * p) * cos(homeController.lat.value * p) * 
        (1 - cos((washStoreResponse!.data[index].attributes.long - homeController.long.value) * p))/2;
        km.value = (12742 * asin(sqrt(a)).roundToDouble());
        print((12742 * asin(sqrt(a))).toStringAsFixed(2));
  return 12742 * asin(sqrt(a));
}
}
