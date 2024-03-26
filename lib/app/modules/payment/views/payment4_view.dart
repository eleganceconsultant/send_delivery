import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:send_delivery/app/modules/payment/views/payment5_view.dart';

class Payment4View extends GetView {
  const Payment4View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          onPressed: () {
            Get.to(Payment5View());
            // Get.offAll(MainView());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ยืนยัน",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF2FA8FF),
          ),
        ),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "การชำระเงินสำเร็จ",
              style: TextStyle(
                  color: Color(0xFF146906),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "ขอบคุณที่ใช้บริการ SEND",
              style: TextStyle(
                  color: Color(0xFF686868),
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.black,
                    height: 1,
                    width: Get.width / 4,
                  ),
                  Text(
                    "ให้คะแนนไรเดอร์",
                    style: TextStyle(
                        color: Color(0xFF686868),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    color: Colors.black,
                    height: 1,
                    width: Get.width / 4,
                  ),
                ],
              ),
            ),
            Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Image.asset(
                  "assets/Star 1.png",
                  scale: 10,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
