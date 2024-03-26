import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:send_delivery/app/modules/main/views/main_view.dart';

class Payment5View extends GetView {
  const Payment5View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Get.offAll(MainView());
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "สั่งออเดอร์อื่น",
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Get.offAll(MainView());
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ยืนยัน",
                      style: TextStyle(
                          color: Color(0xFF2FA8FF),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  // foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 245, 243, 242)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                            color: Color(0xFF2FA8FF),
                          )))),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
           Image.asset("assets/logobig.png",scale: 2.5,),
           SizedBox(height: 20,),
            Text(
              "ขอบคุณที่ใช้บริการ SEND",
              style: TextStyle(
                  color: Color(0xFF686868),
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
         
          ],
        ),
      ),
    );
  }
}
