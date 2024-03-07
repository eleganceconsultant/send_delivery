import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:send_delivery/app/modules/home/controllers/home_controller.dart';
import 'package:send_delivery/util/constants.dart';

import '../controllers/ordering_controller.dart';

class OrderingView extends GetView<OrderingController> {
  OrderingView({Key? key}) : super(key: key);
  final orderingController = Get.put(OrderingController());
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Obx(() => Text(
                "${orderingController.storeName.value}",
                style: TextStyle(fontSize: 14),
              )),
          centerTitle: false,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(() {
                  if (orderingController.storeName.value.contains("Otteri")) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Color(0xFF5AC5F1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: size.width * 0.6,
                            child: Column(
                              children: [
                                Text(
                                  orderingController.storeName.value,
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "./assets/otteri.png",
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  return SizedBox();
                }),
                Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Text("สถานที่รับ - จัดส่ง")),
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(5),
                  width: size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF000000).withOpacity(0.05),
                          offset: Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ]),
                  child: Column(children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/placeholder.png",
                          width: 14,
                        ),
                        label: Text(
                          homeController.addr.value,
                          overflow: TextOverflow.ellipsis,
                        ))
                  ]),
                ),
                Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Text("น้ำหนัก")),
                ListView(
                  shrinkWrap: true,
                  children: [
                    Obx(() => ListTile(
                          title: Text("0-10 Kg"),
                          leading: Radio(
                              toggleable: true,
                              activeColor: primaryColor,
                              splashRadius: 2,
                              value: 5,
                              groupValue: orderingController.option.value,
                              onChanged: (value) {
                                orderingController.option.value = value!;
                              }),
                        )),
                    Obx(() => ListTile(
                          title: Text("11-15 Kg"),
                          leading: Radio(
                              toggleable: true,
                              activeColor: primaryColor,
                              splashRadius: 2,
                              value: 10,
                              groupValue: orderingController.option.value,
                              onChanged: (value) {
                                orderingController.option.value = value!;
                              }),
                        )),
                    Obx(() => ListTile(
                          title: Text("16-20 Kg"),
                          leading: Radio(
                              toggleable: true,
                              activeColor: primaryColor,
                              splashRadius: 2,
                              value: 20,
                              groupValue: orderingController.option.value,
                              onChanged: (value) {
                                orderingController.option.value = value!;
                              }),
                        )),
                  ],
                ),
                Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Text("บริการเสริม")),
                SingleChildScrollView(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Obx(
                        () => CheckboxListTile(
                            title: Text("น้ำยาซักผ้า +10"),
                            activeColor: primaryColor,
                            value: orderingController.laundry.value,
                            onChanged: (value) {
                              orderingController.laundry.value = value!;
                            }),
                      ),
                      Obx(
                        () => CheckboxListTile(
                            title: Text("น้ำยาปรับผ้าหนุ่ม +10"),
                            activeColor: primaryColor,
                            value: orderingController.soft.value,
                            onChanged: (value) {
                              orderingController.soft.value = value!;
                            }),
                      ),
                      Obx(
                        () => CheckboxListTile(
                            title: Text("อบแห้ง +40"),
                            activeColor: primaryColor,
                            value: orderingController.spin.value,
                            onChanged: (value) {
                              orderingController.spin.value = value!;
                            }),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                     orderingController.priceCal();
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
            ),
          ),
        ));
  }
}
