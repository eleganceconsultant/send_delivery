import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MapsService {
  static Future<bool> handleLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;
  
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    Get.snackbar("แจ้งเตือน", "กรุณาอนุญาตให้สามารถเข้าถึงพื้นที่");
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {   
      Get.snackbar("title", "สิทธิ์การเข้าถึง ไม่ได้รับอนุญาต");
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    Get.snackbar("แจ้งเตือน", "ไม่สามารถเข้าถึงพื้นทีได้ เนื่องจากไม่ได้รับสิทธิ์การเข้าถึง");
    return false;
  }
  return true;
}
}