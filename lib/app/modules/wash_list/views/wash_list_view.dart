import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:send_delivery/app/modules/home/controllers/home_controller.dart';
import 'package:send_delivery/app/modules/ordering/views/ordering_view.dart';
import 'package:send_delivery/app/modules/wash/controllers/wash_controller.dart';
import 'package:send_delivery/util/constants.dart';

import '../controllers/wash_list_controller.dart';

class WashListView extends GetView<WashListController> {
  const WashListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final washListController = Get.put(WashListController());
    HomeController homeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: TextButton.icon(
              onPressed: () {
                homeController.onInit();
              },
              icon: Icon(
                Icons.map,
                color: primaryColor,
              ),
              label: Obx(
                () => Container(
                  width: 200,
                  child: Text(
                    "ที่อยู่ " + homeController.addr.value,
                    style: GoogleFonts.notoSansThai(color: Color(0xEF4D4D4D)),
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                  ),
                ),
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Obx(() => washListController.isLoad.value == false
              ? Column(
                  children: [
                    Container(
                      child: Image.asset("assets/map.png"),
                    ),
                    if (washCtr.name == "Otteri") Otteri(),
                    if (washCtr.name == "Kirei") Kirei(),
                    if (washCtr.name == "Laundrybar") Laundrybar(),
                    SizedBox(
                      height: 20,
                    ),
                    ShopList(
                        washListController: washListController, size: size),
                  ],
                )
              : LottieBuilder.network(
                  "https://lottie.host/2344b9c1-42db-46d7-90d7-ba8c4a269ecc/axgM0r94Bg.json")),
        ),
      ),
    );
  }
}

class ShopList extends StatelessWidget {
  const ShopList({
    super.key,
    required this.washListController,
    required this.size,
  });

  final WashListController washListController;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: washListController.washStoreResponse!.data.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(() => OrderingView(), arguments: [
              washListController.washStoreResponse!.data[index].attributes.lat,
              washListController.washStoreResponse!.data[index].attributes.long,
              washListController.washStoreResponse!.data[index].attributes.name
            ]);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Container(
              child: Column(
                children: [
                  Container(
                    // width: size.width,
                    // height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF000000).withOpacity(0.16),
                            offset: Offset(1, 2),
                            blurRadius: 10,
                            spreadRadius: 4,
                          ),
                        ]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            width: size.width,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(10)),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  image: DecorationImage(
                                      image: NetworkImage(mainLink +
                                          washListController
                                              .washStoreResponse!
                                              .data[index]
                                              .attributes
                                              .profileImage
                                              .data
                                              .attributes
                                              .url),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Text(
                                    washListController
                                            .calculateDistance(index)
                                            .toStringAsFixed(2) +
                                        "กม.",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.deepOrange),
                                  ),
                                ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: size.width * 0.7,
                                            child: Text(
                                              washListController.washStoreResponse!
                                                  .data[index].attributes.name,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          Text(
                                            "ราคาเริ่มต้น",
                                            style: TextStyle(
                                                fontSize: 13, color: Color(0xFF146906)),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Text(
                                        "40",
                                        style: TextStyle(
                                            fontSize: 25, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Otteri extends StatelessWidget {
  const Otteri({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 75, 192, 239),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "รายการบริการ",
                style: GoogleFonts.notoSansThai(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Otteri สาขาใกล้ฉัน",
                style: GoogleFonts.notoSansThai(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(),
          Image.asset(
            "assets/oteri.png",
            scale: 7,
          )
        ],
      ),
    );
  }
}

class Kirei extends StatelessWidget {
  const Kirei({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFF4CE3C),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "รายการบริการ",
                style: GoogleFonts.notoSansThai(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "KIREI สาขาใกล้ฉัน",
                style: GoogleFonts.notoSansThai(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(),
          Image.asset(
            "assets/kirei.png",
            scale: 7,
          )
        ],
      ),
    );
  }
}

class Laundrybar extends StatelessWidget {
  const Laundrybar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFF8EF22),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "รายการบริการ",
                style: GoogleFonts.notoSansThai(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Laundry Bar สาขาใกล้ฉัน",
                style: GoogleFonts.notoSansThai(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(),
          Image.asset(
            "assets/Laundrybar.png",
            scale: 7,
          )
        ],
      ),
    );
  }
}
