import 'package:http/http.dart' as http;
import 'package:send_delivery/app/data/brand_model.dart';
import 'package:send_delivery/app/data/wash_store.dart';
import 'package:send_delivery/util/constants.dart';

class BrandsApi {
   BrandsResponse? brandsResponse;
  static Future<BrandsResponse> getBrand() async {
    var request = await http.get(Uri.parse(baseURL + "/wash-brands?populate=*"),
        headers: httpHeaders);
      var brands;

    if (request.statusCode == 200) {
      brands = brandsResponseFromJson(request.body);
      print(brands);
    }

    return brandsResponseFromJson(request.body);
  }

 static Future<WashStoreResponse>getWawshStore() async{
     var request = await http.get(Uri.parse(baseURL + "/wash-lists?populate=*"),
        headers: httpHeaders);
        if (request.statusCode == 200) {
          print(request.body);
        }
    return washStoreResponseFromJson(request.body);
  }
}
