import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:send_delivery/app/modules/ordering/views/order_detail_view.dart';

class OrderingController extends GetxController {
  //TODO: Implement OrderingController

  var lat = 0.0.obs;
  var long = 0.0.obs;
  var storeName = "".obs;
  var option = 0.obs;
  var laundry = false.obs;
  var soft = false.obs;
  var salf = false.obs;
  var spin = false.obs;
  var total = 0.obs;
  var promptPay = false.obs;
  var card = false.obs;
  var paymentMethod = "".obs;
  Map<String, dynamic>? paymentIntent;
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController note = TextEditingController();
  @override
  void onInit() {
    lat.value = Get.arguments[0];
    long.value = Get.arguments[1];
    storeName.value = Get.arguments[2];
    print("++++++++++++++++++++ ORDERING ++++++++++++++++++++++");
    print(storeName.value);
    print(lat.value);
    print(long.value);

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

  priceCal() async {
    var priceCal = 0;
    if (option.value == 5) {
      priceCal += 40;
    }
    if (option.value == 10) {
      priceCal += 40;
    }
    if (option.value == 20) {
      priceCal += 40;
    }
    soft.value == true ? priceCal += 10 : priceCal += 0;
    laundry.value == true ? priceCal += 10 : priceCal += 0;
    spin.value == true ? priceCal += 40 : priceCal += 0;
    print("================ PRICE CALCULATE ================\n$priceCal");
    total.value = priceCal;
    Get.to(()=> OrderDetailView());
  }

  createPaymentIntent() async {
    var response = await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_intents'),
      headers: {
        'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: {
        "amount": "${total.value * 100}",
        "currency": "THB",
        "email": "support@sendgood.online"
       
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
     
      return jsonDecode(response.body);
    }
  }
  Future<void> stripeMakePayment() async {
   
      paymentIntent = await createPaymentIntent();
      Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntent!['client_secret'],
        style: ThemeMode.system,
        merchantDisplayName: "SENd"
      ));
      displayPaymentSheet();
  }
  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
       print("+++++++++++++++ PromptPay ++++++++++++++++++++++++++++++");
          
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed"),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print('$e');
    }
  }
 
}
