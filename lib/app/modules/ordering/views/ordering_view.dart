import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
       backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton(
            onPressed: () {
                 orderingController.calAmount();
            },
            child: Text(
              "ยืนยัน",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF2FA8FF),
            ),
          ),
        ),
        // appBar: AppBar(
        //   titleSpacing: 0,
        //   title: Obx(() => Text(
        //         "${orderingController.storeName.value}",
        //         style: TextStyle(fontSize: 14),
        //       )),
        //   centerTitle: false,
        // ),
        body: Container(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: Get.width,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/machine.png"),
                          fit: BoxFit.fill),
                      color: Colors.amber),
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
                  margin: EdgeInsets.only(top: 230),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(26),
                        topRight: Radius.circular(26),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "รายการบริการ",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xFF146906),
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "Otteri",
                              style: GoogleFonts.inter(
                                  fontSize: 24,
                                  color: Color(0xFF646464),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "สาขา" +
                                  orderingController.storeName.value
                                      .replaceAll("Otteri Wash & Dry", ""),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF646464),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "บริการซักผ้า",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            tap10(),
                            tap14(),
                            tap18(),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "น้ำยาซักผ้า&ปรับผ้านุ่ม อบผ้า ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                orderingController.tapAddOn("li");
                              },
                              child: Obx(() => Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    decoration: BoxDecoration(
                                      color:
                                          orderingController.addLiquid.value ==
                                                  true
                                              ? Colors.green.shade100
                                              : Colors.white,
                                      border: Border.all(
                                          color: orderingController
                                                      .addLiquid.value ==
                                                  true
                                              ? Colors.green
                                              : Colors.blue),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(
                                              0.5), //color of shadow
                                          spreadRadius: 1, //spread radius
                                          blurRadius: 7, // blur radius
                                          offset: Offset(0,
                                              4), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "เพิ่มน้ำยา",
                                          style: GoogleFonts.notoSansThai(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: orderingController
                                                          .addLiquid.value ==
                                                      true
                                                  ? Colors.green
                                                  : Colors.blue),
                                        ),
                                        Text(
                                          " + 20฿",
                                          style: GoogleFonts.notoSans(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                orderingController.tapAddOn("dry");
                              },
                              child: Obx(() => Container(
                                    
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    decoration: BoxDecoration(
                                      color: orderingController.addDry.value ==
                                              true
                                          ? Colors.green.shade100
                                          : Colors.white,
                                      border: Border.all(
                                          color:
                                              orderingController.addDry.value ==
                                                      true
                                                  ? Colors.green
                                                  : Colors.blue),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(
                                              0.5), //color of shadow
                                          spreadRadius: 1, //spread radius
                                          blurRadius: 7, // blur radius
                                          offset: Offset(0,
                                              4), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "อบผ้า",
                                          style: GoogleFonts.notoSansThai(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: orderingController
                                                          .addDry.value ==
                                                      true
                                                  ? Colors.green
                                                  : Colors.blue),
                                        ),
                                        Text(
                                          " + 40฿",
                                          style: GoogleFonts.notoSans(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "น้ำอุ่น",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            orderingController.tapWater();
                          },
                          child: Obx(() => Container(
                                width: 170,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                decoration: BoxDecoration(
                                  color:
                                      orderingController.addWater.value == true
                                          ? Colors.green.shade100
                                          : Colors.white,
                                  border: Border.all(color: orderingController.addWater.value == true ?Colors.green : Colors.blue),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.5), //color of shadow
                                      spreadRadius: 1, //spread radius
                                      blurRadius: 7, // blur radius
                                      offset: Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "น้ำอุ่น",
                                      style: GoogleFonts.notoSansThai(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: orderingController.addWater.value == true ?Colors.green : Colors.blue),
                                    ),
                                    Text(
                                      " + 10฿",
                                      style: GoogleFonts.notoSans(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        // Container(
                        //   width: size.width,
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 20, vertical: 10),
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       orderingController.priceCal();
                        //     },
                        //     child: Text(
                        //       "ถัดไป",
                        //       style:
                        //           TextStyle(color: Colors.white, fontSize: 18),
                        //     ),
                        //     style: ElevatedButton.styleFrom(
                        //       backgroundColor: Color(0xFF0FD3FF),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),

                // Obx(() {
                //   if (orderingController.storeName.value.contains("Otteri")) {
                //     return Otteri(size: size, orderingController: orderingController);
                //   }
                //   // if (orderingController.storeName.value.contains("Kirei")) {
                //   //   return Kirei(size: size, orderingController: orderingController);
                //   // }
                //   return SizedBox();
                // }),
                // Container(
                //     alignment: Alignment.bottomLeft,
                //     margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                //     child: Text("สถานที่รับ - จัดส่ง")),
                // Container(
                //   margin: EdgeInsets.all(20),
                //   padding: EdgeInsets.all(5),
                //   width: size.width,
                //   height: 60,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: Colors.white,
                //       boxShadow: [
                //         BoxShadow(
                //           color: Color(0xFF000000).withOpacity(0.05),
                //           offset: Offset(0, 0),
                //           blurRadius: 10,
                //           spreadRadius: 2,
                //         ),
                //       ]),
                //   child: Column(children: [
                //     TextButton.icon(
                //         onPressed: () {},
                //         icon: Image.asset(
                //           "assets/placeholder.png",
                //           width: 14,
                //         ),
                //         label: Text(
                //           homeController.addr.value,
                //           overflow: TextOverflow.ellipsis,
                //         ))
                //   ]),
                // ),
                // Container(
                //     alignment: Alignment.bottomLeft,
                //     margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                //     child: Text("น้ำหนัก")),
                // ListView(
                //   shrinkWrap: true,
                //   children: [
                //     Obx(() => ListTile(
                //           title: Text("0-10 Kg"),
                //           leading: Radio(
                //               toggleable: true,
                //               activeColor: primaryColor,
                //               splashRadius: 2,
                //               value: 5,
                //               groupValue: orderingController.option.value,
                //               onChanged: (value) {
                //                 orderingController.option.value = value!;
                //               }),
                //         )),
                //     Obx(() => ListTile(
                //           title: Text("11-15 Kg"),
                //           leading: Radio(
                //               toggleable: true,
                //               activeColor: primaryColor,
                //               splashRadius: 2,
                //               value: 10,
                //               groupValue: orderingController.option.value,
                //               onChanged: (value) {
                //                 orderingController.option.value = value!;
                //               }),
                //         )),
                //     Obx(() => ListTile(
                //           title: Text("16-20 Kg"),
                //           leading: Radio(
                //               toggleable: true,
                //               activeColor: primaryColor,
                //               splashRadius: 2,
                //               value: 20,
                //               groupValue: orderingController.option.value,
                //               onChanged: (value) {
                //                 orderingController.option.value = value!;
                //               }),
                //         )),
                //   ],
                // ),
                // Container(
                //     alignment: Alignment.bottomLeft,
                //     margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                //     child: Text("บริการเสริม")),
                // SingleChildScrollView(
                //   child: ListView(
                //     shrinkWrap: true,
                //     children: [
                //       Obx(
                //         () => CheckboxListTile(
                //             title: Text("น้ำยาซักผ้า +10"),
                //             activeColor: primaryColor,
                //             value: orderingController.laundry.value,
                //             onChanged: (value) {
                //               orderingController.laundry.value = value!;
                //             }),
                //       ),
                //       Obx(
                //         () => CheckboxListTile(
                //             title: Text("น้ำยาปรับผ้าหนุ่ม +10"),
                //             activeColor: primaryColor,
                //             value: orderingController.soft.value,
                //             onChanged: (value) {
                //               orderingController.soft.value = value!;
                //             }),
                //       ),
                //       Obx(
                //         () => CheckboxListTile(
                //             title: Text("อบแห้ง +40"),
                //             activeColor: primaryColor,
                //             value: orderingController.spin.value,
                //             onChanged: (value) {
                //               orderingController.spin.value = value!;
                //             }),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }

  GestureDetector tap18() {
    return GestureDetector(
      onTap: () {
        // orderingController.tapWash14.value = true;
        orderingController.tap(18);
      },
      child: Obx(() => Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
              color: orderingController.tapWash18.value == true
                  ? Colors.green.shade100
                  : Colors.white,
              border: Border.all(
                  color: orderingController.tapWash18.value == true
                      ? Colors.green
                      : Colors.blue),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 1, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "18 KG",
                  style: GoogleFonts.notoSans(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: orderingController.tapWash18.value == true
                          ? Colors.green
                          : Colors.blue),
                ),
                Text(
                  "70฿",
                  style: GoogleFonts.notoSans(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ],
            ),
          )),
    );
  }

  GestureDetector tap14() {
    return GestureDetector(
      onTap: () {
        // orderingController.tapWash14.value = true;
        orderingController.tap(14);
      },
      child: Obx(() => Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
              color: orderingController.tapWash14.value == true
                  ? Colors.green.shade100
                  : Colors.white,
              border: Border.all(
                  color: orderingController.tapWash14.value == true
                      ? Colors.green
                      : Colors.blue),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 1, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "14 KG",
                  style: GoogleFonts.notoSans(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: orderingController.tapWash14.value == true
                          ? Colors.green
                          : Colors.blue),
                ),
                Text(
                  "60฿",
                  style: GoogleFonts.notoSans(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ],
            ),
          )),
    );
  }

  GestureDetector tap10() {
    return GestureDetector(
      onTap: () {
        orderingController.tap(10);
      },
      child: Obx(() => Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
              color: orderingController.tapWash10.value == true
                  ? Colors.green.shade100
                  : Colors.white,
              border: Border.all(
                  color: orderingController.tapWash10.value == true
                      ? Colors.green
                      : Colors.blue),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 1, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(0, 4), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
                ),
                //you can set more BoxShadow() here
              ],
            ),
            child: Column(
              children: [
                Text(
                  "10 KG",
                  style: GoogleFonts.notoSans(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: orderingController.tapWash10.value == true
                          ? Colors.green
                          : Colors.blue),
                ),
                Text(
                  "40฿",
                  style: GoogleFonts.notoSans(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ],
            ),
          )),
    );
  }
}

class Otteri extends StatelessWidget {
  const Otteri({
    super.key,
    required this.size,
    required this.orderingController,
  });

  final Size size;
  final OrderingController orderingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      width: size.width,
      decoration: BoxDecoration(
          color: Color(0xFF5AC5F1), borderRadius: BorderRadius.circular(10)),
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
}

class Kirei extends StatelessWidget {
  const Kirei({
    super.key,
    required this.size,
    required this.orderingController,
  });

  final Size size;
  final OrderingController orderingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      width: size.width,
      decoration: BoxDecoration(
          color: Color(0xFF5AC5F1), borderRadius: BorderRadius.circular(10)),
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
              "assets/kirei.png",
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
