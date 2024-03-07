import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_delivery/app/modules/login/controllers/login_controller.dart';
import 'package:send_delivery/util/constants.dart';

class PhoneloginviewView extends GetView {
  const PhoneloginviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController phoneNumber = TextEditingController();
    final loginController = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เริ่มต้นใช้งาน',
          style: text_defualt,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Center(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              child: Image.asset(
                'assets/logo.png',
                width: 100,
              ),
            ),
            TextFormField(
              controller: phoneNumber,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "เบอร์โทรศัพท์",
                  hintStyle: GoogleFonts.notoSansThai()),
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: primaryColor),
                child: Text(
                  'ส่งรหัส OTP',
                  style: text_defualt,
                ),
                onPressed: () {
                  print("PH: ${phoneNumber.text}");
                  loginController.sendOtp(phoneNumber.text);
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
