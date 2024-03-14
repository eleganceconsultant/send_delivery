import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_delivery/app/modules/payment/controllers/payment_controller.dart';
import 'package:send_delivery/app/modules/payment/views/payment3_view.dart';

class Payment2View extends GetView {
  const Payment2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          onPressed: () {
            Get.to(()=> Payment3View());
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
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Obx(() => Column(
                children: [
                  if (paymentCtr.payType.value == "PromptPay")
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'สแกนเพื่อชำระเงิน',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Color(0xFF146906),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 10),
                            child: Image.asset(
                              "assets/qr.png",
                              scale: 2,
                            )),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 10),
                            child: Image.asset(
                              "assets/Group 99.png",
                            )),
                      ],
                    ),
                  if (paymentCtr.payType.value == "Cash")
                    Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                              
                              decoration: BoxDecoration(
                                  color: Color(0xFF47CB31),
                                  borderRadius: BorderRadius.circular(18)),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text("เงินสดปลายทาง",style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                          ),),
                                          Text("",style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                          ),),
                                          Text("",style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                          ),),
                                        
                                        ],
                                      ),Spacer(),
                                      Column(
                                        children: [
                                         SizedBox(height: 40,),
                                          Text("ชำระเงิน",style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                          ),),
                                          Text("120฿",style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                          ),),
                                        ],
                                      ),
                                    ],
                                  ),
                            )),
                      ],
                    ),
                  if (paymentCtr.payType.value == "Scb")
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'การชำระเงิน',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Color(0xFF146906),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "ราคารวม",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(""),
                                    Text(""),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text(""),
                                    Text(
                                      "ชำระเงิน",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      "120฿",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF2FA8FF)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 10),
                            child: Image.asset("assets/Group 98.png"))
                      ],
                    )
                ],
              ))),
    );
  }
}
