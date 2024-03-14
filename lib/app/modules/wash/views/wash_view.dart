import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:send_delivery/app/modules/home/controllers/home_controller.dart';
import 'package:send_delivery/app/modules/wash_list/views/wash_list_view.dart';
import 'package:send_delivery/util/constants.dart';

import '../controllers/wash_controller.dart';

class WashView extends GetView<WashController> {
  const WashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    WashController washController = Get.put(WashController());
    return Scaffold(
       backgroundColor: Colors.white,
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
                  ),
                ),
              )),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(40, 50, 0, 20),
              child: Text(
                "เลือกร้านค้า",
                style: GoogleFonts.notoSansThai(fontSize: 30),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Obx(() => washController.isLoad.value == false
                  ? GridView.builder(
                      shrinkWrap: true,
                      itemCount: washController.brandsResponse!.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 5),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => WashListView(),
                                arguments: washController.brandsResponse!
                                    .data[index].attributes.name);
                            washCtr.name.value = washController
                                .brandsResponse!.data[index].attributes.name;
                                print(washCtr.name.value);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(mainLink +
                                        washController
                                            .brandsResponse!
                                            .data[index]
                                            .attributes
                                            .image
                                            .data
                                            .attributes
                                            .url))),
                          ),
                        );
                      },
                    )
                  : LottieBuilder.network(
                      "https://lottie.host/2344b9c1-42db-46d7-90d7-ba8c4a269ecc/axgM0r94Bg.json")),
            )
          ],
        ),
      ),
    );
  }
}
