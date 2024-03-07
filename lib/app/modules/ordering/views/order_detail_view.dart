import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:send_delivery/app/modules/home/controllers/home_controller.dart';
import 'package:send_delivery/app/modules/ordering/controllers/ordering_controller.dart';
import 'package:send_delivery/util/constants.dart';

class OrderDetailView extends GetView {
  const OrderDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderingController());
    HomeController homeController = Get.find();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายละเอียดคำสั่งซื้อ'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(20),
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: "จัดส่งไปที่", style: TextStyle(fontSize: 16)),
                    TextSpan(
                        text: "\n${homeController.addr.value}",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFFEF4141))),
                  ]),
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(text: "ข้อมูลการติดต่อ"),
                    TextSpan(text: "*", style: TextStyle(color: primaryColor))
                  ]))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  TextFormField(
                    validator: (phone) {
                      if (phone == "") {
                        return "กรุณาใส่เบอร์โทรติดต่อ";
                      }
                      return null;
                    },
                    controller: orderController.phone,
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(148, 240, 240, 240),
                        filled: true,
                        border: InputBorder.none,
                        hintText: "เบอร์โทร"),
                  ),
                ],
              ),
            ),
            ListView(
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      );
                    }
                    return Text("0 บาท");
                  }),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(color: Color(0xFF00CF68),borderRadius: BorderRadius.circular(10)),
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
                      // Get.bottomSheet(BottomSheet(
                      //     onClosing: () {},
                      //     builder: (context) {
                      //       return Container(
                      //         padding: EdgeInsets.all(20),
                      //         width: size.width,
                      //         height: size.height / 3,
                      //         child: Column(children: [
                      //           SizedBox(
                      //             width: size.width,
                      //             height: 150,
                      //               child: Lottie.network('https://lottie.host/f2847038-38d8-4ef6-80cd-8e5c1720a5d0/dJXmDGqjbO.json'),),
                      //               Text("กำลังค้นหาไรเดอร์...")
                      //         ]),
                      //       );
                      //     }));
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
            )
          ],
        ),
      ),
    );
  }
}
