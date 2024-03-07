import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:send_delivery/app/modules/home/views/home_page_view.dart';
import 'package:send_delivery/app/modules/login/models/otp_response.dart';
import 'package:send_delivery/app/modules/login/models/otp_verify_response.dart';

class OtpApi {
  Future<Otp> sendOTP(String phone) async {

    var responseData;
    var url = Uri.parse("https://otp.thaibulksms.com/v2/otp/request");
    var headers = {'Content-Type': 'application/json'};
    var request = await http.post(url,
        headers: headers,
        body: json.encode({
          "key": "1788127556332350",
          "secret": "6c47739e06bfcdfed56294f7452d9000",
          "msisdn": "${phone}"
        }));

    if (request.statusCode == 200) {
      print(otpFromJson(request.body));
      responseData = otpFromJson(request.body);
    } else {
      print(request.reasonPhrase);
    }

    return responseData;
  }

  Future<OtpVerifyResponse> otpVerify(token, pin) async {
    var url = Uri.parse("https://otp.thaibulksms.com/v2/otp/verify");
    var headers = {'Content-Type': 'application/json'};
    var data;
    var request = await http.post(url,
        headers: headers,
        body: json.encode({
          "key": "1788127556332350",
          "secret": "6c47739e06bfcdfed56294f7452d9000",
          "token": "${token}",
          "pin": "${pin}"
        }));

    if (request.statusCode == 200) {
      print(request.body);
      print(request.body.runtimeType);
      
      Get.to(()=>HomePageView());
      return data;
    } else {
      print(request.reasonPhrase);
    }

    return data;
  }
}
