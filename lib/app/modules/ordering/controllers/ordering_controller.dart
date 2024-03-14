import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:send_delivery/app/modules/ordering/views/order_detail_view.dart';

final orderingCtr = Get.put(OrderingController());

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

  RxInt washKg = 0.obs;
  RxInt washAmount = 0.obs;
  RxBool addLiquid = false.obs;
  RxBool addDry = false.obs;
  RxInt liqid = 0.obs;
  RxInt dry = 0.obs;
  RxInt worm = 0.obs;
  RxInt sendService = 49.obs;
  RxBool addWater = false.obs;
  RxBool tapWash10 = false.obs;
  RxBool tapWash14 = false.obs;
  RxBool tapWash18 = false.obs;
  RxInt amount = 0.obs;

  tap(tap) {
    if (tap == 10) {
      washKg.value = 10;
      washAmount.value = 40;
      tapWash10.value = true;
      tapWash18.value = false;
      tapWash14.value = false;
    } else if (tap == 14) {
      washKg.value = 14;
      tapWash14.value = true;
      tapWash18.value = false;
      tapWash10.value = false;
      washAmount.value = 60;
    } else if (tap == 18) {
      washKg.value = 18;
      tapWash10.value = false;
      tapWash14.value = false;
      tapWash18.value = true;
      washAmount.value = 70;
    }
  }

  tapAddOn(add) {
    if (add == "li") {
      addLiquid.value = !addLiquid.value;
      if (addLiquid.value == false) {
        liqid.value = 0;
      } else {
        liqid.value = 20;
      }
    } else if (add == "dry") {
      addDry.value = !addDry.value;
      if (addDry.value == false) {
        dry.value = 0;
      } else {
        dry.value = 40;
      }
    }
  }

  tapWater() {
    addWater.value = !addWater.value;
    worm.value = 10;
    print(addWater.value);
  }

  calAmount() async {
    amount.value = await washAmount.value +
        liqid.value +
        dry.value +
        worm.value +
        sendService.value;
    Get.to(() => OrderDetailView());
    print(amount.value);
  }

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
    Get.to(() => OrderDetailView());
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
    Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntent!['client_secret'],
            style: ThemeMode.system,
            merchantDisplayName: "SENd"));
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
