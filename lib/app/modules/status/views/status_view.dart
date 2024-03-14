import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_delivery/app/modules/chat/views/chat_view.dart';

import '../controllers/status_controller.dart';

class StatusView extends GetView<StatusController> {
  const StatusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
       backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(onPressed: statusCtr.set()),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Obx(() => Column(
                  children: [
                    if (statusCtr.status.value == "Status1")
                      Container(
                        width: Get.width,
                        height: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/house-2 1.png"),
                            scale: 3,
                          ),
                        ),
                      ),
                    if (statusCtr.status.value == "Send")
                      Container(
                        width: Get.width,
                        height: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/3696912-02 1.png"),
                            scale: 3,
                          ),
                        ),
                      ),
                    if (statusCtr.status.value == "Shop")
                      Container(
                        width: Get.width,
                        height: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/washing-machine 1.png"),
                            scale: 4,
                          ),
                        ),
                      ),
                    if (statusCtr.status.value == "washFinish")
                      Container(
                        width: Get.width,
                        height: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/laundry 2.png"),
                            scale: 4,
                          ),
                        ),
                      ),
                    if (statusCtr.status.value == "sendBack")
                      Container(
                        width: Get.width,
                        height: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/3696912-02 1 (1).png"),
                            scale: 4,
                          ),
                        ),
                      ),
                  ],
                )),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (statusCtr.status.value == "Status1" ||
                              statusCtr.status.value == "Send")
                            Text(
                              "ไรเดอร์กำลังเข้าไปรับพัสดุ\nตามพิกัดของคุณ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold),
                            ),
                          if (statusCtr.status.value == "Shop")
                            Text(
                              "พัสดุของคุณถึงร้านซักผ้า",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold),
                            ),
                          if (statusCtr.status.value == "washFinish")
                            Text(
                              "คำสั่งของคุณเสร็จแล้ว",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold),
                            ),
                          if (statusCtr.status.value == "sendBack")
                            Text(
                              "ไรเดอร์กำลังเข้าไปส่งพัสดุ\nตามพิกัดของคุณ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold),
                            ),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(() => Column(
                        children: [
                          if (statusCtr.status.value == "Status1" ||
                              statusCtr.status.value == "Send" || statusCtr.status.value == "sendBack" )
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Image.asset(
                                "assets/map.png",
                              ),
                            ),
                          if (statusCtr.status.value == "Shop")
                            Column(
                              children: [
                                SizedBox(height: 30,),
                                Text(
                                  "ไรเดอร์กำลังนำพัสดุเข้าขบวนการ\nทำความสะอาดตามคำสั่ง\nโปรดรอตามเวลาที่แจ้งไว้ข้างต้น",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFFA9A9A9),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 75, 192, 239),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/oteri.png",
                                        scale: 8,
                                      ),
                                      Spacer(),
                                      Text("Otteri",
                                          style: GoogleFonts.notoSans(
                                              fontSize: 24,
                                              color: Color(0xffFFFFFF)))
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Text(
                                      "ระยะเวลาในกระบวนการซักผ้า",
                                     
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF000000),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          if (statusCtr.status.value == "washFinish")
                            Column(
                              children: [
                                SizedBox(height: 30,),
                                Text(
                                  "ไรเดอร์กำลังเข้าไปรับพัสดุ \nและนำไปส่งตามพิกัดของคุณ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFFA9A9A9),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                      
                               
                              ],
                            ),
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/Component 15.png",
                        scale: 8,
                      ),
                      Image.asset(
                        "assets/Component 17.png",
                        scale: 8,
                      ),
                      Image.asset(
                        "assets/Component 20.png",
                        scale: 8,
                      ),
                      Image.asset(
                        "assets/Component 23.png",
                        scale: 8,
                      ),
                      Image.asset(
                        "assets/Component 25.png",
                        scale: 8,
                      ),
                    ],
                  ),
                  statusCtr.status.value == "washFinish"
                ?  SizedBox(
                    height: 150,
                  )
                  :SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 48, // Image radius
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTO2vBQ1vOla9pPM6M0ZsYZb7OckCS21cgN_Q&usqp=CAU'),
                      ),
                      Column(
                        children: [
                          Text(""),
                          Text(
                            "นายมานะ มาแล้วจ้ะ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Vespa Sport i 150",
                            style: GoogleFonts.notoSans(
                                fontSize: 13, color: Color(0xffA9A9A9)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(""),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "คะแนนการบริการ",
                            style: TextStyle(
                                fontSize: 10, color: Color(0xffA9A9A9)),
                          ),
                          Text(
                            "5.0",
                            style: GoogleFonts.notoSans(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ChatView());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFEBEBEB)),
                      child: Row(
                        children: [
                          Text("แชทกับไรเดอร์"),
                          Spacer(),
                          Icon(Icons.phone),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.chat_outlined)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
