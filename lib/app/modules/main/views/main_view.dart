import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:send_delivery/app/modules/home/views/home_page_view.dart';
import 'package:send_delivery/app/modules/home/views/home_view.dart';
import 'package:send_delivery/app/modules/payment/views/payment_view.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => getActiveTabPage(),
        ),
        bottomNavigationBar: Obx(
          () => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              border: Border.all(
                color: Colors.black,
                width: 3
              )
            ),
            child: SalomonBottomBar(
              currentIndex: mainCtr.currentIndex.value,
              onTap: (value) {
                mainCtr.onTap(value);
              },
              backgroundColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.0),
              curve: Curves.ease,
              
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: ImageIcon(AssetImage("assets/Vector.png")),
                  title: Text(
                    "หน้าแรก",
                    style: GoogleFonts.notoSansThai(
                      fontSize: 15,
                    ),
                  ),
                  selectedColor: Color(0xFF000000),
                ),
            
                /// Likes
                SalomonBottomBarItem(
                  icon: ImageIcon(AssetImage("assets/rectangle-list 1.png")),
                  title: Text(
                    "รายการ",
                    style: GoogleFonts.notoSansThai(
                      fontSize: 15,
                    ),
                  ),
                  selectedColor: Colors.pink,
                ),
            
                /// Search
                SalomonBottomBarItem(
                  icon: ImageIcon(AssetImage("assets/wallet 1.png")),
                  title: Text(
                    "ชำระเงิน",
                    style: GoogleFonts.notoSansThai(
                      fontSize: 15,
                    ),
                  ),
                  selectedColor: Colors.orange,
                ),
            
                /// Profile
                SalomonBottomBarItem(
                  icon: ImageIcon(AssetImage("assets/01 align center.png")),
                  title: Text(
                    "ข้อความ",
                    style: GoogleFonts.notoSansThai(
                      fontSize: 15,
                    ),
                  ),
                  selectedColor: Colors.teal,
                ),
            
                SalomonBottomBarItem(
                  icon: ImageIcon(AssetImage("assets/circle-user 1.png")),
                  title: Text(
                    "บัญชี",
                    style: GoogleFonts.notoSansThai(
                      fontSize: 15,
                    ),
                  ),
                  selectedColor: Colors.blue,
                ),
              ],
            ),
          ),
        ));
  }

  Widget getActiveTabPage() {
    switch (mainCtr.currentIndex.value) {
      case 0:
        return HomePageView();
      case 1:
        return HomePageView();
      case 2:
        return PaymentView();
      default:
        return const SizedBox.shrink();
    }
  }
}
