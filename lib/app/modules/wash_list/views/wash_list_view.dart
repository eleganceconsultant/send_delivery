import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:send_delivery/app/modules/home/controllers/home_controller.dart';
import 'package:send_delivery/app/modules/ordering/views/ordering_view.dart';
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
      body: Center(
        child: Obx(() => washListController.isLoad.value == false
            ? ListView.builder(
                itemCount: washListController.washStoreResponse!.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => OrderingView(), arguments: [
                        washListController
                            .washStoreResponse!.data[index].attributes.lat,
                        washListController
                            .washStoreResponse!.data[index].attributes.long,
                        washListController
                            .washStoreResponse!.data[index].attributes.name
                      ]);
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: size.width,
                            height: 200,
                            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
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
                            child: Stack(children: [
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
                              Positioned(
                                  top: 125,
                                  left: 25,
                                  child: SizedBox(
                                    width: size.width * 0.7,
                                    child: Text(
                                      washListController
                                              .calculateDistance(index)
                                              .toStringAsFixed(2) +
                                          "กม.",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.deepOrange),
                                    ),
                                  )),
                              Positioned(
                                  top: 140,
                                  left: 25,
                                  child: SizedBox(
                                    width: size.width * 0.7,
                                    child: Text(
                                      washListController.washStoreResponse!
                                          .data[index].attributes.name,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )),
                              Positioned(
                                  top: 165,
                                  left: 25,
                                  child: Text(
                                    "ราคาเริ่มต้น",
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFF146906)),
                                  )),
                              Positioned(
                                  top: 140,
                                  right: 25,
                                  child: Text(
                                    "40",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ]),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            : LottieBuilder.network(
                "https://lottie.host/2344b9c1-42db-46d7-90d7-ba8c4a269ecc/axgM0r94Bg.json")),
      ),
    );
  }
}
