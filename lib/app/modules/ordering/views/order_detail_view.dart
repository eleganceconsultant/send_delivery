import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:send_delivery/app/modules/home/controllers/home_controller.dart';
import 'package:send_delivery/app/modules/ordering/controllers/ordering_controller.dart';
import 'package:send_delivery/app/modules/status/views/status_view.dart';
import 'package:send_delivery/util/constants.dart';

class OrderDetailView extends GetView {
  const OrderDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderingController());
    HomeController homeController = Get.find();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: size.width,  
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => StatusView());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "ยืนยันคำสั่ง",
                  style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                  
                ),
                Spacer(),
                Text(
                  "120฿",
                  style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.bold,
                    color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF2FA8FF),
          ),
        ),
      ),
      // appBar: AppBar(
      //   title: const Text('รายละเอียดคำสั่งซื้อ'),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/oteri.png"),
                  scale: 3,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                margin: EdgeInsets.only(top: 50, left: 20),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFD9D9D9)),
                child: Icon(
                  Icons.arrow_back,
                  size: 35,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(top: 270),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "รายการคำสั่ง",
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF146906),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "SENd Express . ส่งซัก",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF686868),
                    ),
                  ),
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
            )
            // Container(
            //     padding: EdgeInsets.all(20),
            //     child: Text.rich(
            //       TextSpan(children: [
            //         TextSpan(
            //             text: "จัดส่งไปที่", style: TextStyle(fontSize: 16)),
            //         TextSpan(
            //             text: "\n${homeController.addr.value}",
            //             style:
            //                 TextStyle(fontSize: 14, color: Color(0xFFEF4141))),
            //       ]),
            //     )),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //   child: Column(
            //     children: [
            //       Text.rich(TextSpan(children: [
            //         TextSpan(text: "ข้อมูลการติดต่อ"),
            //         TextSpan(text: "*", style: TextStyle(color: primaryColor))
            //       ]))
            //     ],
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //   child: Column(
            //     children: [
            //       TextFormField(
            //         validator: (phone) {
            //           if (phone == "") {
            //             return "กรุณาใส่เบอร์โทรติดต่อ";
            //           }
            //           return null;
            //         },
            //         controller: orderController.phone,
            //         decoration: InputDecoration(
            //             fillColor: Color.fromARGB(148, 240, 240, 240),
            //             filled: true,
            //             border: InputBorder.none,
            //             hintText: "เบอร์โทร"),
            //       ),
            //     ],
            //   ),
            // ),
            // Detail(orderController: orderController, size: size)
          ],
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({
    super.key,
    required this.orderController,
    required this.size,
  });

  final OrderingController orderController;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text("รายละเอียด"),
          subtitle: Obx(() {
            if (orderController.option.value == 5) {
              return Text("น้ำหนัก 0-5 กก.");
            } else if (orderController.option.value == 10) {
              return Text("น้ำหนัก 6-10 กก.");
            } else if (orderController.option.value == 20) {
              return Text("น้ำหนัก 11-20 กก.");
            }
            return Text("");
          }),
          trailing: Obx(() {
            if (orderController.option.value == 5) {
              return Text("40 บาท");
            } else if (orderController.option.value == 10) {
              return Text("40 บาท");
            } else if (orderController.option.value == 20) {
              return Text("40 บาท");
            }
            return Text("");
          }),
        ),
        ListTile(
          subtitle: Obx(() {
            if (orderController.laundry.value == true) {
              return Text("น้ำยาซักผ้า");
            }
            return Text("น้ำยาซักผ้า");
          }),
          trailing: Obx(() {
            if (orderController.laundry.value == true) {
              return Text("10 บาท");
            }
            return Text("0 บาท");
          }),
        ),
        ListTile(
          subtitle: Obx(() {
            if (orderController.soft.value == true) {
              return Text("น้ำยาปรับผ้านุ่ม");
            }
            return Text("น้ำยาปรับผ้านุ่ม");
          }),
          trailing: Obx(() {
            if (orderController.soft.value == true) {
              return Text("10 บาท");
            }
            return Text("0 บาท");
          }),
        ),
        ListTile(
          subtitle: Obx(() {
            if (orderController.spin.value == true) {
              return Text("อบแห้ง");
            }
            return Text("อบแห้ง");
          }),
          trailing: Obx(() {
            if (orderController.spin.value == true) {
              return Text("40 บาท");
            }
            return Text("0 บาท");
          }),
        ),
        ListTile(
          title: Text("รวม"),
          trailing: Obx(() {
            if (orderController.spin.value == true) {
              return Text(
                "${orderController.total.value} บาท",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              );
            }
            return Text("0 บาท");
          }),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Color(0xFF00CF68),
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text("ช่องทางการชำระเงิน"),
            subtitle: Text("เงินสด"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
        ),
        Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton(
            onPressed: () {
              orderController.stripeMakePayment();
              Get.bottomSheet(BottomSheet(
                  onClosing: () {},
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      width: size.width,
                      height: size.height / 3,
                      child: Column(children: [
                        SizedBox(
                          width: size.width,
                          height: 150,
                          child: Lottie.network(
                              'https://lottie.host/f2847038-38d8-4ef6-80cd-8e5c1720a5d0/dJXmDGqjbO.json'),
                        ),
                        Text("กำลังค้นหาไรเดอร์...")
                      ]),
                    );
                  }));
            },
            child: Text(
              "ถัดไป",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0FD3FF),
            ),
          ),
        )
      ],
    );
  }
}
