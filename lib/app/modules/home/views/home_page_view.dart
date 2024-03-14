import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:send_delivery/app/modules/home/controllers/home_controller.dart';
import 'package:send_delivery/app/modules/wash/views/wash_view.dart';
import 'package:send_delivery/util/constants.dart';

class HomePageView extends GetView {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    Size size = MediaQuery.of(context).size;
    final width = Get.width;
    final height = Get.height;
    return Scaffold(
       backgroundColor: Colors.white,
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Container(
                child: TextButton.icon(
                    onPressed: () {
                      homeController.onInit();
                    },
                    icon: Icon(
                      Icons.map,
                      color: primaryColor,
                    ),
                    label: Obx(
                      () => Text(
                        "ที่อยู่ " + homeController.addr.value,
                        style:
                            GoogleFonts.notoSansThai(color: Color(0xEF4D4D4D)),
                        overflow: TextOverflow.fade,
                      ),
                    )),
              ),
            ),
            Stack(
              children: [
                FutureBuilder(
                    future: homeController.getBanner(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final img = snapshot.data!.data.attributes.image.data[0]
                            .attributes.formats.thumbnail.url;
                        print("banner--->");
                        print(mainLink + img);
                        return Container(
                          width: size.width,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(mainLink + img),
                                  fit: BoxFit.fitHeight)),
                        );
                      } else {
                        print(snapshot.error);
                        return LottieBuilder.network(
                            "https://lottie.host/2344b9c1-42db-46d7-90d7-ba8c4a269ecc/axgM0r94Bg.json");
                      }
                    }),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: size.height / 5),
                    width: size.width - 30,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF000000).withOpacity(0.46),
                            offset: Offset(0, 2),
                            blurRadius: 9,
                            spreadRadius: -2,
                          ),
                        ],
                        color: Colors.white),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.qr_code_scanner,
                              color: primaryColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: primaryColor,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.only(top: 20, left: 40),
              child: Text(
                "บริการ",
                style: GoogleFonts.notoSansThai(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
                textAlign: TextAlign.left,
              ),
            ),
             SizedBox(height: 10,),
            Obx(
              () => homeController.isLoad.value == false
                  ? GestureDetector(
                    onTap: () {
                       Get.to(() => WashView());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset("assets/Button Row img.jpg")),
                  )
                  // SizedBox(
                  //     height: 140,
                  //     child: ListView.builder(
                  //         shrinkWrap: true,
                  //         scrollDirection: Axis.horizontal,
                  //         itemCount: homeController.moduleResponse!.data.length,
                  //         itemBuilder: (context, index) {
                  //           return Column(
                  //             children: [
                  //               InkWell(
                  //                 onTap: () {
                  //                   Get.to(() => WashView());
                  //                 },
                  //                 child: Container(
                  //                   width: size.width - 10,
                  //                   height: size.height / 7,
                  //                   // padding: EdgeInsets.symmetric(horizontal:20),
                  //                   // decoration: BoxDecoration(
                  //                   //   borderRadius: BorderRadius.circular(50),
                  //                   // ),
                  //                   child: Image.network(mainLink +
                  //                       homeController
                  //                           .moduleResponse!
                  //                           .data[index]
                  //                           .attributes
                  //                           .image
                  //                           .data
                  //                           .attributes
                  //                           .url),
                  //                 ),
                  //               ),
                  //             ],
                  //           );
                  //         }),
                  //   )
                  : Container(
                      child: Text("No Data"),
                    ),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                        title: "",
                        content: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              Text("Comming Soon")
                            ],
                          ),
                        )
                      );
                    },
                    child: BuyCard()),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                       Get.defaultDialog(
                        title: "",
                        content: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              Text("Comming Soon")
                          
                            ],
                          ),
                        )
                      );
                    },
                    child: SendCard())
                ],
              ),
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.only(top: 50, bottom: 10, left: 40),
              child: Text(
                "โปรโมชัน",
                style: GoogleFonts.notoSansThai(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
                textAlign: TextAlign.left,
              ),
            ),
            FutureBuilder(
                future: homeController.getPromotion(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final img = snapshot.data!.data.attributes.image.data
                        .attributes.formats.thumbnail.url;
                    print(mainLink + img);
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: size.width,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(mainLink + img),
                              fit: BoxFit.fitWidth)),
                    );
                  } else {
                    return Container();
                  }
                }),
          ],
        ),
      ),
    ));
  }
}

class SendCard extends StatelessWidget {
  const SendCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
   
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color:
                  Colors.grey.withOpacity(0.5), //color of shadow
              spreadRadius: 3, //spread radius
              blurRadius: 10, // blur radius
              offset: Offset(0, 2), // changes position of shadow
              //first paramerter of offset is left-right
              //second parameter is top to down
            ),
            //you can set more BoxShadow() here
          ],
        ),
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFF1CF),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset(
                    "assets/Rectangle.png",
                    scale: 10,
                  ),
                )),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "สะดวกส่ง",
                  style: TextStyle(
                    fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF5B5B5B)
                  )
                ),
                Text("บริการ รับ-ส่ง พัสดุ",
                  style: TextStyle(
                    fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFA3A3A3)
                  )),
              ],
            )
          ],
        ));
  }
}


class BuyCard extends StatelessWidget {
  const BuyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       
         padding: EdgeInsets.symmetric(vertical: 10,horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color:
                  Colors.grey.withOpacity(0.5), //color of shadow
              spreadRadius: 3, //spread radius
              blurRadius: 10, // blur radius
              offset: Offset(0, 2), // changes position of shadow
              //first paramerter of offset is left-right
              //second parameter is top to down
            ),
            //you can set more BoxShadow() here
          ],
        ),
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFF1CF),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset(
                    "assets/Rectangle 111.png",
                    scale: 10,
                  ),
                )),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "สะดวกซื้อ",
                  style: TextStyle(
                    fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF5B5B5B)
                  )
                ),
                Text("สั่งซื้อสิ้นค้าจากร้านค้า",
                  style: TextStyle(
                    fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFA3A3A3)
                  )),
              ],
            )
          ],
        ));
  }
}
