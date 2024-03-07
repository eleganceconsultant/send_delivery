import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:send_delivery/app/data/banner_model.dart';
import 'package:http/http.dart' as http;
import 'package:send_delivery/app/data/module_response.dart';
import 'package:send_delivery/app/data/promotions_response.dart';
import 'package:send_delivery/app/services/map.dart';
import 'package:send_delivery/util/constants.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final addr = "".obs;
  final lat = 0.0.obs;
  final long = 0.0.obs;
  final count = 0.obs;
  ModuleResponse? moduleResponse;
  final isLoad = true.obs;

  @override
  void onInit() async {
    getCurrentLocation();

    getModules().then((value) {
       moduleResponse = value;
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

  Future<BannerResponse> getBanner() async {
    print("======== Get Banner ==========");
    var request = await http.get(Uri.parse(baseURL + "/banner?populate=*"),
        headers: httpHeaders);
    var bannerData;
    print(request.body);

    if (request.statusCode == 200) {
      bannerData = bannerResponseFromJson(request.body);
      print(bannerData);
    }

    return bannerResponseFromJson(request.body);
  }

  Future<ModuleResponse> getModules() async {
    print("============== GET Services ================");
    var request = await http.get(Uri.parse(baseURL + "/modules?populate=*"),
        headers: httpHeaders);
    var moduleData;

    if (request.statusCode == 200) {
      moduleData = moduleResponseFromJson(request.body);
      print(moduleData);
    }

    return moduleResponseFromJson(request.body);
  }

  Future<PromotionResponse> getPromotion() async {
    var request = await http.get(Uri.parse(baseURL + "/promotion?populate=*"),
        headers: httpHeaders);
    var promotionData;

    if (request.statusCode == 200) {
      promotionData = promotionResponseFromJson(request.body);
      print(promotionData);
    }

    return promotionResponseFromJson(request.body);
  }

  Future<void> getCurrentLocation() async {
    final permissionMap = await MapsService.handleLocationPermission();
    if (!permissionMap) {
      return;
    }
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      print(value);
      lat.value = value.latitude;
      long.value = value.longitude;
      placemarkFromCoordinates(value.latitude, value.longitude).then((value) {
        Placemark placemark = value[0];
        print(
            "${placemark.name} ${placemark.subLocality} ${placemark.locality} ${placemark.postalCode}");
        addr.value =
            "${placemark.name} ${placemark.subLocality} ${placemark.locality} ${placemark.postalCode}";
      });
    });
  }
}
