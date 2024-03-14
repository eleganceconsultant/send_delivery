import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:send_delivery/app/modules/main/views/main_view.dart';

class Payment3View extends GetView {
  const Payment3View({Key? key}) : super(key: key);
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
            Get.offAll(MainView());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "เสร็จสิ้น",
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/bill 1.png",
              scale: 3,
            ),
            SizedBox(height: 20,),
            Text("การชำระเงินสำเร็จ",style: TextStyle(
              color: Color(0xFF146906),
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),),
            Text("ขอบคุณสำหรับการชำระเงิน",style: TextStyle(
              color: Color(0xFF686868),
              fontSize: 13,
              fontWeight: FontWeight.bold
            ),),
          ],
        ),
      ),
    );
  }
}
