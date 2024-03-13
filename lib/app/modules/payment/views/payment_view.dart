import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_delivery/app/modules/payment/views/payment2_view.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เลือกวิธีการชำระเงิน'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => Payment2View());
              },
              child: Image.asset("assets/scb.png")),
            Image.asset("assets/promptpay.png"),
            Image.asset("assets/viacash.png"),
            Image.asset("assets/sendwallet.png"),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "บริการซักผ้าน้ำหนัก 18 KG",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "60.00฿",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "บริการน้ำยาซักผ้า&ปรับผ้านุ่ม",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "20.00฿",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "บริการอบผ้า",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "40.00฿",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "บริการพับผ้า",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "ไม่มี",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "บริการ SENd",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "39.00฿",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                       
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text("ราคารวม",style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),),
                        Text(""),
                        Text(""),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(""),
                        Text("ชำระเงิน",style: TextStyle(
                          fontSize: 15,
                         
                        ),),
                        Text("120฿",style: GoogleFonts.notoSans(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2FA8FF)
                        ),),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
